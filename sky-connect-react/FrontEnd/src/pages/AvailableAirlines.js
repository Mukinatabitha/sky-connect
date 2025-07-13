import React, { useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import '../styles/AvailableAirlines.css';

export default function AvailableAirlines() {
    const [airlines, setAirlines] = useState([]);
    const [error, setError] = useState('');
    const navigate = useNavigate();

    useEffect(() => {
        fetch('http://localhost:8000/getAirlines.php') // ✅ Replace with actual path
            .then((res) => res.json())
            .then((data) => {
                if (Array.isArray(data)) {
                    setAirlines(data);
                } else {
                    setError('❌ Failed to fetch airlines.');
                }
            })
            .catch((err) => {
                console.error(err);
                setError('❌ Error fetching airline data.');
            });
    }, []);

    return (
        <div className="airlines-container">
            <h2 className="section-title">Available Airlines</h2>
            {error && <p className="error-text">{error}</p>}
            <div className="flight-grid">
                {airlines.map((airline, idx) => (
                    <div className="flight-card" key={idx}>
                        <h3>{airline}</h3>
                        <button
                            className="details-btn"
                            onClick={() => navigate(`/flight-details?airline=${encodeURIComponent(airline)}`)}
                        >
                            View Details
                        </button>
                    </div>
                ))}
            </div>
        </div>
    );
}
