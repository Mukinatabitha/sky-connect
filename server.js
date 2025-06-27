require('dotenv').config();
const express = require('express');
const Stripe = require('stripe');
const cors = require('cors');

const app = express();
const stripe = Stripe(process.env.STRIPE_SECRET_KEY);

app.use(cors());
app.use(express.json());

// Payment intent endpoint
app.post('/create-payment-intent', async (req, res) => {
  try {
    const { amount, currency, payment_method_types } = req.body;

    if (!amount) {
      return res.status(400).json({ error: 'Amount is required' });
    }

    const paymentIntent = await stripe.paymentIntents.create({
      amount,
      currency: currency || 'usd',
      payment_method_types: payment_method_types || ['card'],
    });

    res.status(200).json({ clientSecret: paymentIntent.client_secret });
  } catch (err) {
    console.error('Payment Intent Error:', err);
    res.status(500).json({ error: err.message });
  }
});

// Test route (optional)
app.get('/', (req, res) => {
  res.send('SkyConnect Payment API is live');
});

// Start server
const PORT = process.env.PORT || 5000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
