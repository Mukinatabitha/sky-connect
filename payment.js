document.addEventListener('DOMContentLoaded', () => {
  const stripe = Stripe('pk_test_YOUR_PUBLIC_KEY');
  const elements = stripe.elements();
  const card = elements.create('card');
  card.mount('#card-element');

  const radios = document.querySelectorAll('input[name="paymentMethod"]');
  const cardDetails = document.getElementById('cardDetails');
  const mobileMoneyDetails = document.getElementById('mobileMoneyDetails');
  const otpGroup = document.getElementById('otpGroup');
  const resendOtp = document.getElementById('resendOtp');
  const otpTimer = document.getElementById('otpTimer');
  const payNowBtn = document.getElementById('payNowBtn');

  const confirmModal = document.getElementById('confirmModal');
  const confirmYes = document.getElementById('confirmYes');
  const confirmNo = document.getElementById('confirmNo');

  const errorModal = document.getElementById('errorModal');
  const errorMessage = document.getElementById('errorMessage');
  const errorOk = document.getElementById('errorOk');
  const sendOtpBtn = document.getElementById('sendOtpBtn');


  function updatePaymentSections() {
    const method = document.querySelector('input[name="paymentMethod"]:checked');
    if (!method) return;

    if (method.value === 'Mobile Money') {
      cardDetails.style.display = 'none';
      mobileMoneyDetails.style.display = 'block';
      cardDetails.setAttribute('aria-hidden', 'true');
      mobileMoneyDetails.setAttribute('aria-hidden', 'false');
      startOTPTimer();
    } else {
      cardDetails.style.display = 'block';
      mobileMoneyDetails.style.display = 'none';
      cardDetails.setAttribute('aria-hidden', 'false');
      mobileMoneyDetails.setAttribute('aria-hidden', 'true');
    }
  }

  radios.forEach(radio => {
    radio.addEventListener('change', updatePaymentSections);
  });

  // OTP timer
  let otpTimeout;
  function startOTPTimer() {
    resendOtp.disabled = true;
    let time = 300;
    function tick() {
      const m = Math.floor(time / 60);
      const s = (time % 60).toString().padStart(2, '0');
      otpTimer.textContent = `Time left: ${m}:${s}`;
      if (time > 0) {
        time--;
        otpTimeout = setTimeout(tick, 1000);
      } else {
        resendOtp.disabled = false;
      }
    }
    tick();
  }

  resendOtp.addEventListener('click', () => {
    startOTPTimer();
  });

  function validateForm() {
    document.querySelectorAll('.error-message').forEach(e => e.textContent = '');
    const method = document.querySelector('input[name="paymentMethod"]:checked');
    if (!method) {
      alert('Select a payment method.');
      return false;
    }
    if (method.value === 'Mobile Money') {
      if (!document.getElementById('phoneNumber').value.trim()) {
        document.getElementById('phoneNumberError').textContent = 'Phone number required.';
        return false;
      }
      if (!document.getElementById('otp').value.trim()) {
        document.getElementById('otpError').textContent = 'OTP required.';
        return false;
      }
    } else {
      if (!document.getElementById('cardName').value.trim()) {
        document.getElementById('cardNameError').textContent = 'Card name required.';
        return false;
      }
    }
    return true;
  }

  payNowBtn.addEventListener('click', () => {
    if (!validateForm()) return;
    confirmModal.style.display = 'block';
    confirmModal.setAttribute('aria-hidden', 'false');
  });

  confirmNo.addEventListener('click', () => {
    confirmModal.style.display = 'none';
    confirmModal.setAttribute('aria-hidden', 'true');
  });

  confirmYes.addEventListener('click', async () => {
    confirmModal.style.display = 'none';
    payNowBtn.disabled = true;
    payNowBtn.classList.add('loading');

    const method = document.querySelector('input[name="paymentMethod"]:checked').value;

    try {
      if (method === 'Mobile Money') {
        await new Promise(resolve => setTimeout(resolve, 2000)); // Simulate success
        location.href = 'BookingConfirmation.html';
        return;
      }
      const name = document.getElementById('cardName').value;

      const res = await fetch('/create-payment-intent', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ amount: 10000, currency: 'usd', payment_method_types: ['card'] })
      });

      const { clientSecret } = await res.json();

      const result = await stripe.confirmCardPayment(clientSecret, {
        payment_method: { card, billing_details: { name } }
      });

      if (result.error) throw result.error;
      location.href = 'BookingConfirmation.html';
    } catch (err) {
      errorMessage.textContent = err.message || 'Payment failed.';
      errorModal.style.display = 'block';
      errorModal.removeAttribute('aria-hidden');
    } finally {
      payNowBtn.disabled = false;
      payNowBtn.classList.remove('loading');
    }
  });

  errorOk.addEventListener('click', () => {
    errorModal.style.display = 'none';
    errorModal.setAttribute('aria-hidden', 'true');
  });

  sendOtpBtn.addEventListener('click', () => {
  const phoneNumber = document.getElementById('phoneNumber').value.trim();
  if (!phoneNumber) {
    document.getElementById('phoneNumberError').textContent = 'Enter your phone number first.';
    return;
  }

  // Simulate OTP being sent (here you’d trigger your backend OTP API)
  console.log(`Sending OTP to ${phoneNumber}`);

  // Show the OTP group + start timer
  document.getElementById('otpGroup').style.display = 'block';
  startOTPTimer();

  // Optionally disable the Send OTP button after sending
  sendOtpBtn.disabled = true;
});
});



