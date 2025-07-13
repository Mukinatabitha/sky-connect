import React from 'react';
import '../styles/Home.css'; // Reuse the same CSS if styles are shared

import Header from '../components/Header';
import Footer from '../components/Footer';

export default function About() {
    return (
        <>
            <Header />
            <main>
                <section className="hero">
                    <div className="container">
                        <div className="hero-content">
                            <h1>About <span>SkyConnect</span></h1>
                            <p>Your trusted partner in simplifying global air travel, one booking at a time.</p>
                        </div>
                    </div>
                </section>

                <section className="container" style={{ padding: '3rem 0' }}>
                    <section aria-labelledby="who-we-are">
                        <h2 id="who-we-are" style={{ textAlign: 'center' }}>Who We Are</h2>
                        <p style={{ maxWidth: '800px', margin: '1.5rem auto', textAlign: 'center' }}>
                            SkyConnect is a flight-only travel aggregator dedicated to streamlining your travel experience.
                            We bring together flight data from over 300 global airlines, enabling users to find, compare,
                            and book flights with ease.
                        </p>
                    </section>

                    <section aria-labelledby="our-mission">
                        <h2 id="our-mission" style={{ textAlign: 'center' }}>Our Mission</h2>
                        <p style={{ maxWidth: '800px', margin: '1.5rem auto', textAlign: 'center' }}>
                            To empower travelers by providing a seamless, transparent, and intelligent flight booking journey—
                            while offering layover support services such as lounges, wellness packages, and accommodations.
                        </p>
                    </section>

                    <section aria-labelledby="what-sets-us-apart">
                        <h2 id="what-sets-us-apart" style={{ textAlign: 'center' }}>What Sets Us Apart</h2>
                        <ul style={{
                            maxWidth: '800px',
                            margin: '2rem auto',
                            listStyle: 'disc',
                            paddingLeft: '2rem',
                            color: '#374151'
                        }}>
                            <li>Smart layover services</li>
                            <li>Real-time flight availability and seat selection</li>
                            <li>Secure, PCI-compliant payment processing</li>
                            <li>Global inventory from multiple GDS and airlines</li>
                        </ul>
                    </section>
                </section>
            </main>
            <Footer />
        </>
    );
}
