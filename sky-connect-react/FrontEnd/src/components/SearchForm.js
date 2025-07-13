import React, { useState } from 'react';
import '../styles/Home.css';


export default function SearchForm() {
    const [formData, setFormData] = useState({
        origin: '',
        destination: '',
        departDate: '',
        returnDate: '',
        flightType: 'direct',
        budget: '',
        flightClass: 'economy',
        passengerCount: 1
    });

    const handleChange = (e) => {
        const { name, value } = e.target;
        setFormData(prev => ({ ...prev, [name]: value }));
    };

    const handleSubmit = (e) => {
        e.preventDefault();
        const { origin, destination, departDate } = formData;

        if (!origin || !destination || !departDate) {
            alert("Please fill in Origin, Destination, and Departure Date.");
            return;
        }

        const params = new URLSearchParams(formData).toString();
        window.location.href = `/results?${params}`;
    };

    return (
        <div className="search-card" role="search" aria-label="Flight Search Form">
            <form className="search-form" onSubmit={handleSubmit}>
                {/* Form Rows */}
                <div className="form-row">
                    <div className="form-group">
                        <label htmlFor="origin">Origin</label>
                        <input type="text" id="origin" name="origin" placeholder="e.g. Nairobi" value={formData.origin} onChange={handleChange} required />
                    </div>
                    <div className="form-group">
                        <label htmlFor="destination">Destination</label>
                        <input type="text" id="destination" name="destination" placeholder="e.g. Tokyo" value={formData.destination} onChange={handleChange} required />
                    </div>
                </div>

                <div className="form-row">
                    <div className="form-group">
                        <label htmlFor="departDate">Departure Date</label>
                        <input type="date" id="departDate" name="departDate" value={formData.departDate} onChange={handleChange} required />
                    </div>
                    <div className="form-group">
                        <label htmlFor="returnDate">Return Date</label>
                        <input type="date" id="returnDate" name="returnDate" value={formData.returnDate} onChange={handleChange} />
                    </div>
                </div>

                <div className="form-row">
                    <fieldset className="form-group">
                        <legend>Flight Type</legend>
                        <label><input type="radio" name="flightType" value="direct" checked={formData.flightType === 'direct'} onChange={handleChange} /> Direct</label>
                        <label><input type="radio" name="flightType" value="layover" checked={formData.flightType === 'layover'} onChange={handleChange} /> Layover</label>
                    </fieldset>
                    <div className="form-group">
                        <label htmlFor="budget">Max Budget ($)</label>
                        <input type="number" id="budget" name="budget" placeholder="e.g. 1000" min="0" value={formData.budget} onChange={handleChange} />
                        <small className="form-text">Optional</small>
                    </div>
                </div>

                <div className="form-row">
                    <div className="form-group">
                        <label htmlFor="flightClass">Flight Class</label>
                        <select id="flightClass" name="flightClass" value={formData.flightClass} onChange={handleChange}>
                            <option value="economy">Economy</option>
                            <option value="business">Business</option>
                            <option value="first">First Class</option>
                        </select>
                    </div>
                    <div className="form-group">
                        <label htmlFor="passengerCount">Passengers</label>
                        <input type="number" id="passengerCount" name="passengerCount" min="1" max="10" value={formData.passengerCount} onChange={handleChange} />
                    </div>
                </div>

                <button type="submit" className="search-btn">Search Flights</button>
            </form>
        </div>
    );
}
