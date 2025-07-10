const express = require('express');
const path = require('path');
const bodyParser = require('body-parser');

const app = express();
const PORT = 8080;

// Middleware
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

// Serve static files (HTML, CSS, JS)
app.use(express.static(path.join(__dirname, 'public')));

// Fake payment processing endpoint
app.post('/process-payment', (req, res) => {
  const { paymentMethod, cardName, phoneNumber, otp } = req.body;

  console.log('Processing payment...');
  console.log('Payment Method:', paymentMethod);
  if (paymentMethod === 'Visa' || paymentMethod === 'Mastercard') {
    console.log('Card Name:', cardName);
  } else if (paymentMethod === 'Mobile Money') {
    console.log('Phone:', phoneNumber);
    console.log('OTP:', otp);
  }

  // Simulate successful payment
  res.redirect('/BookingConfirmation.html');
});

// Start server
app.listen(PORT, () => {
  console.log(`✅ Server running on http://localhost:${PORT}`);
});
