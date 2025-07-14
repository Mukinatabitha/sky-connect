import React from 'react';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';

// Page components
import Home from './pages/Home';
import About from './pages/About';
import Contact from './pages/Contact';
import SignIn from './pages/SignIn';
import SignUp from './pages/SignUp';
import ThankYou from './pages/ThankYou';
import AvailableAirlines from './pages/AvailableAirlines';
import FlightDetails from './pages/FlightDetails';
import Payment from './pages/Payment';
import BookingConfirmation from './pages/BookingConfirmation';

function App() {
    return (
        <Router>
            <Routes>
                <Route path="/" element={<Home />} />
                <Route path="/about" element={<About />} />
                <Route path="/contact" element={<Contact />} />
                <Route path="/signin" element={<SignIn />} />
                <Route path="/signup" element={<SignUp />} />
                <Route path="/thankyou" element={<ThankYou />} />
                <Route path="/airlines" element={<AvailableAirlines />} />
                <Route path="/flight-details" element={<FlightDetails />} />
                <Route path="/payment" element={<Payment />} />
                <Route path="/confirmation" element={<BookingConfirmation />} />


            </Routes>
        </Router>
    );
}

export default App;


