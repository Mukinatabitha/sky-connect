import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import '../styles/Payment.css';

export default function Payment() {
    const [paymentMethod, setPaymentMethod] = useState('');
    const [phoneNumber, setPhoneNumber] = useState('');
    const [otp, setOtp] = useState('');
    const [showCardSection, setShowCardSection] = useState(false);
    const [showMobileMoneySection, setShowMobileMoneySection] = useState(false);
    const navigate = useNavigate();

    const handlePaymentChange = (method) => {
        setPaymentMethod(method);
        setShowCardSection(method === 'Visa' || method === 'Mastercard');
        setShowMobileMoneySection(method === 'Mobile Money');
    };

    const handleSendOtp = () => {
        document.getElementById('otpGroup').style.display = 'block';
        document.getElementById('resendOtp').disabled = true;
        let seconds = 60;
        const timer = setInterval(() => {
            if (seconds <= 0) {
                clearInterval(timer);
                document.getElementById('resendOtp').disabled = false;
                document.getElementById('otpTimer').textContent = '';
            } else {
                document.getElementById('otpTimer').textContent = `Resend OTP in ${seconds--}s`;
            }
        }, 1000);
    };

    const handleConfirm = () => {
        document.getElementById('confirmModal').style.display = 'block';
        document.getElementById('confirmModal').setAttribute('aria-hidden', 'false');
    };

    const handleCancel = () => {
        document.getElementById('confirmModal').style.display = 'none';
        document.getElementById('confirmModal').setAttribute('aria-hidden', 'true');
    };

    const confirmAndRedirect = () => {
        navigate('/booking-confirmation');
    };

    return (
        <div className="payment-container">
            <h2>Payment Information</h2>

            <form id="paymentForm">
                <div className="payment-methods">
                    {['Visa', 'Mastercard', 'Mobile Money'].map((method) => (
                        <label className="payment-option" key={method}>
                            <input
                                type="radio"
                                name="paymentMethod"
                                value={method}
                                checked={paymentMethod === method}
                                onChange={() => handlePaymentChange(method)}
                            />
                            <img src={`/${method.replace(/\s+/g, '')}.png`} alt={method} />
                            <span>{method}</span>
                        </label>
                    ))}
                </div>

                {showCardSection && (
                    <div id="cardDetails" className="payment-section">
                        <div className="form-group">
                            <label htmlFor="cardName">Name on Card</label>
                            <input type="text" id="cardName" name="cardName" />
                        </div>
                        <div className="form-group">
                            <label htmlFor="card-element">Card Information</label>
                            <div id="card-element" className="stripe-card-element" />
                        </div>
                    </div>
                )}

                {showMobileMoneySection && (
                    <div id="mobileMoneyDetails" className="payment-section">
                        <div className="form-group">
                            <label htmlFor="phoneNumber">Phone Number (+254)</label>
                            <input
                                type="tel"
                                id="phoneNumber"
                                name="phoneNumber"
                                value={phoneNumber}
                                onChange={(e) => setPhoneNumber(e.target.value)}
                            />
                        </div>
                        <div className="form-group">
                            <button type="button" id="sendOtpBtn" className="payment-btn" onClick={handleSendOtp}>
                                Send OTP
                            </button>
                        </div>
                        <div className="form-group" id="otpGroup" style={{ display: 'none' }}>
                            <label htmlFor="otp">OTP</label>
                            <input
                                type="text"
                                id="otp"
                                name="otp"
                                value={otp}
                                onChange={(e) => setOtp(e.target.value)}
                            />
                            <button type="button" id="resendOtp" disabled>
                                Resend OTP
                            </button>
                            <p id="otpTimer"></p>
                        </div>
                    </div>
                )}

                <div className="form-group">
                    <button type="button" id="confirmPaymentBtn" className="payment-btn" onClick={handleConfirm}>
                        Confirm Payment
                    </button>
                </div>
            </form>

            {/* Confirm Modal */}
            <div className="modal-overlay" id="confirmModal" aria-hidden="true">
                <div className="modal">
                    <h3>Confirm Payment</h3>
                    <p>Are you sure you want to proceed with the payment?</p>
                    <button onClick={confirmAndRedirect} className="btn-confirm">Yes</button>
                    <button onClick={handleCancel}>Cancel</button>
                </div>
            </div>
        </div>
    );
}
