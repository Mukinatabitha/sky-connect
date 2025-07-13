import React, { useEffect, useState } from 'react';
import '../styles/BookingConfirmation.css';
import { useNavigate } from 'react-router-dom';

export default function BookingConfirmation() {
    const [details, setDetails] = useState(null);
    const [passenger, setPassenger] = useState('');
    const navigate = useNavigate();

    useEffect(() => {
        const storedName = localStorage.getItem('passengerName');
        const bookingDetails = localStorage.getItem('bookingDetails');

        if (!storedName || !bookingDetails) {
            setDetails(null);
            return;
        }

        setPassenger(storedName);
        setDetails(JSON.parse(bookingDetails));
    }, []);

    if (!details || !passenger) {
        return (
            <div className="booking-confirmation-page">
                <div className="container">
                    <div className="confirmation-card">
                        <p style={{ textAlign: 'center', color: '#d00' }}>
                            ❌ Missing booking or user info.
                        </p>
                        <p style={{ textAlign: 'center' }}>
                            <a href="/">Return to Home</a>
                        </p>
                    </div>
                </div>
            </div>
        );
    }

    const reference = 'SKY' + Math.floor(Math.random() * 90000 + 10000);

    return (
        <div className="booking-confirmation-page">
            <header className="booking-confirmation-header">
                <div className="header-container">
                    <img src="/images/skyconnect-logo.png" alt="Sky Connect Logo" className="header-logo" />
                    <span className="header-title">SkyConnect</span>
                </div>
            </header>

            <div className="container">
                <div className="confirmation-card">
                    <div className="photo-collage">
                        {[1, 2, 3, 4, 5, 6].map(num => (
                            <img
                                key={num}
                                src={`https://raw.githubusercontent.com/Mukinatabitha/sky-connect/main/adventure${num}.png`}
                                alt={`Destination ${num}`}
                            />
                        ))}
                    </div>

                    <h1>Your flight is booked.<br />Get ready for your next adventure!</h1>
                    <p className="subtitle">
                        Thank you for choosing SkyConnect. Your booking has been confirmed.
                    </p>

                    <div className="confirmation-details">
                        <div className="detail-row">
                            <span className="detail-label">Booking Reference:</span>
                            <span className="reference-number">{reference}</span>
                        </div>
                        <div className="detail-row">
                            <span className="detail-label">Flight:</span>
                            <span>{details.origin} to {details.destination}</span>
                        </div>
                        <div className="detail-row">
                            <span className="detail-label">Date:</span>
                            <span>{new Date().toLocaleDateString()}</span>
                        </div>
                        <div className="detail-row">
                            <span className="detail-label">Passenger:</span>
                            <span>{passenger}</span>
                        </div>
                        <div className="detail-row">
                            <span className="detail-label">Total Paid:</span>
                            <span>Ksh. {Number(details.price).toLocaleString("en-KE", { minimumFractionDigits: 2 })}</span>
                        </div>
                    </div>

                    <p>Your e-ticket has been generated and is ready for download.</p>
                    <a
                        href={`/download-ticket/${reference}`}
                        className="download-btn"
                    >
                        Download E-Ticket
                    </a>

                    <div className="additional-info">
                        <p>
                            For any questions, please <a href="/contact" className="support-link">contact our customer support</a>.
                        </p>
                    </div>
                </div>
            </div>

            <footer className="booking-confirmation-footer">
                &copy; 2025 SkyConnect.
            </footer>
        </div>
    );
}
