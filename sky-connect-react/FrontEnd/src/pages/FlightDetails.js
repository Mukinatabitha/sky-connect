import React, { useEffect, useState } from 'react';
import { useLocation, useNavigate } from 'react-router-dom';
import '../styles/FlightDetails.css';

export default function FlightDetails() {
    const [flights, setFlights] = useState([]);
    const [error, setError] = useState('');
    const location = useLocation();
    const navigate = useNavigate();

    const queryParams = new URLSearchParams(location.search);
    const airline = queryParams.get('airline');

    useEffect(() => {
        if (!airline) {
            setError('❌ No airline specified.');
            return;
        }

        fetch(`http://localhost:8000/getFlightDetails.php?airline=${encodeURIComponent(airline)}`)
            .then((res) => res.json())
            .then((data) => {
                if (Array.isArray(data)) {
                    setFlights(data);
                } else {
                    setError(data.error || 'Unknown error occurred');
                }
            })
            .catch(() => setError('Failed to fetch flight details.'));
    }, [airline]);

    return (
        <div className="flight-details-container">
            <h2>{airline} - Flight Options</h2>
            {error && <p className="error-text">{error}</p>}

            {flights.map((flight, idx) => (
                <div className="flight-card" key={idx}>
                    <h3>Flight: {flight.flight_number}</h3>
                    <p><strong>From:</strong> {flight.origin} <strong>To:</strong> {flight.destination}</p>
                    <p><strong>Departure:</strong> {flight.departure_time} | <strong>Arrival:</strong> {flight.arrival_time}</p>
                    <p><strong>Type:</strong> {flight.flight_type} | <strong>Class:</strong> Economy</p>
                    <p><strong>Price:</strong> ${parseFloat(flight.price_economy).toFixed(2)}</p>
                    <button
                        className="book-btn"
                        onClick={() => {
                            const params = new URLSearchParams({
                                flight_number: flight.flight_number,
                                origin: flight.origin,
                                destination: flight.destination,
                                price: flight.price_economy,
                                airline: flight.airline
                            });
                            navigate(`/payment?${params.toString()}`);
                        }}
                    >
                        Book Now
                    </button>
                </div>
            ))}
        </div>
    );
}
