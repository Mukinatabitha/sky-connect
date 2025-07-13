import React, { useState } from 'react';
import './style.css';

const PaymentForm = () => {
  const [paymentMethod, setPaymentMethod] = useState('Visa');
  const [cardName, setCardName] = useState('');
  const [phoneNumber, setPhoneNumber] = useState('');
  const [otp, setOtp] = useState('');
  const [showCard, setShowCard] = useState(true);
  const [showMobile, setShowMobile] = useState(false);
  const [showOtp, setShowOtp] = useState(false);
  const [showConfirmModal, setShowConfirmModal] = useState(false);
  const [showErrorModal, setShowErrorModal] = useState(false);
  const [errorMessage, setErrorMessage] = useState('');

  const handlePaymentMethodChange = (e) => {
    const value = e.target.value;
    setPaymentMethod(value);
    setShowCard(value === 'Visa' || value === 'Mastercard');
    setShowMobile(value === 'Mobile Money');
    setShowOtp(false);
  };

  const handleSendOtp = () => {
    if (!phoneNumber) {
      setErrorMessage('Please enter your phone number.');
      setShowErrorModal(true);
      return;
    }
    setShowOtp(true);
  };

  const handleConfirm = async (e) => {
    e.preventDefault();
    setShowConfirmModal(false);
    const paymentData = { paymentMethod, cardName, phoneNumber, otp };
    try {
      const response = await fetch('/process-payment', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(paymentData),
      });
      if (response.redirected) {
        window.location.href = response.url;
      } else if (!response.ok) {
        setErrorMessage('Payment failed.');
        setShowErrorModal(true);
      }
    } catch (err) {
      setErrorMessage('Network error.');
      setShowErrorModal(true);
    }
  };

  return (
    <div className="payment-container">
      <h2>Payment Information</h2>
      <form id="paymentForm" onSubmit={e => e.preventDefault()}>
        <div className="payment-methods">
          <label className="payment-option">
            <input type="radio" name="paymentMethod" value="Visa" checked={paymentMethod === 'Visa'} onChange={handlePaymentMethodChange} />
            <img src="/Visa-Logo.png" alt="Visa" />
            <span>Visa</span>
          </label>
          <label className="payment-option">
            <input type="radio" name="paymentMethod" value="Mastercard" checked={paymentMethod === 'Mastercard'} onChange={handlePaymentMethodChange} />
            <img src="/Mastercard_PNG16.png" alt="Mastercard" />
            <span>Mastercard</span>
          </label>
          <label className="payment-option">
            <input type="radio" name="paymentMethod" value="Mobile Money" checked={paymentMethod === 'Mobile Money'} onChange={handlePaymentMethodChange} />
            <img src="/mpesa.png" alt="Mobile Money" />
            <span>Mobile Money</span>
          </label>
        </div>
        {/* Card payment section */}
        {showCard && (
          <div id="cardDetails" className="payment-section">
            <div className="form-group">
              <label htmlFor="cardName">Name on Card</label>
              <input type="text" id="cardName" name="cardName" value={cardName} onChange={e => setCardName(e.target.value)} />
            </div>
            {/* Stripe card element placeholder */}
            <div className="form-group">
              <label>Card Information</label>
              <div id="card-element" className="stripe-card-element">(Stripe integration placeholder)</div>
            </div>
          </div>
        )}
        {/* Mobile money section */}
        {showMobile && (
          <div id="mobileMoneyDetails" className="payment-section">
            <div className="form-group">
              <label htmlFor="phoneNumber">Phone Number (+254)</label>
              <input type="tel" id="phoneNumber" name="phoneNumber" value={phoneNumber} onChange={e => setPhoneNumber(e.target.value)} />
            </div>
            <div className="form-group">
              <button type="button" id="sendOtpBtn" className="payment-btn" onClick={handleSendOtp}>Send OTP</button>
            </div>
            {showOtp && (
              <div className="form-group" id="otpGroup">
                <label htmlFor="otp">OTP</label>
                <input type="text" id="otp" name="otp" value={otp} onChange={e => setOtp(e.target.value)} />
                <button type="button" id="resendOtp" disabled>Resend OTP</button>
                <p id="otpTimer"></p>
              </div>
            )}
          </div>
        )}
        {/* Confirm Payment Button */}
        <div className="form-group">
          <button type="button" id="confirmPaymentBtn" className="payment-btn" onClick={() => setShowConfirmModal(true)}>Confirm Payment</button>
        </div>
      </form>
      {/* Confirm Modal */}
      {showConfirmModal && (
        <div className="modal-overlay" id="confirmModal">
          <div className="modal">
            <h3>Confirm Payment</h3>
            <p>Are you sure you want to proceed with the payment?</p>
            <button className="btn-confirm" onClick={handleConfirm}>Yes</button>
            <button onClick={() => setShowConfirmModal(false)}>Cancel</button>
          </div>
        </div>
      )}
      {/* Error Modal */}
      {showErrorModal && (
        <div className="modal-overlay" id="errorModal">
          <div className="modal">
            <h3>Error</h3>
            <p>{errorMessage}</p>
            <button onClick={() => setShowErrorModal(false)}>OK</button>
          </div>
        </div>
      )}
    </div>
  );
};

export default PaymentForm;
