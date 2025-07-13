import React, { useState } from 'react';
import '../styles/Home.css';
import Header from '../components/Header';
import Footer from '../components/Footer';

export default function Contact() {
    const [formData, setFormData] = useState({
        name: '',
        email: '',
        message: ''
    });

    const [status, setStatus] = useState('');

    const handleChange = (e) => {
        const { name, value } = e.target;
        setFormData(prev => ({ ...prev, [name]: value }));
    };

    const handleSubmit = async (e) => {
        e.preventDefault();
        setStatus('Sending...');

        try {
            const response = await fetch('/contactform.php', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(formData)
            });

            const result = await response.json();
            if (result.success) {
                setStatus('✅ Message sent successfully!');
                setFormData({ name: '', email: '', message: '' }); // Reset form
            } else {
                setStatus(`❌ ${result.message}`);
            }
        } catch (err) {
            console.error(err);
            setStatus('❌ Failed to send message.');
        }
    };

    return (
        <>
            <Header />
            <section
                className="hero"
                style={{
                    background: "url('https://raw.githubusercontent.com/Mukinatabitha/sky-connect/main/ContactUs%20Image.png') center/cover no-repeat",
                    minHeight: '300px',
                }}
            >
                <div
                    className="container"
                    style={{
                        display: 'flex',
                        alignItems: 'center',
                        justifyContent: 'center',
                        minHeight: '300px',
                    }}
                >
                    <div
                        className="hero-content"
                        style={{ color: 'white', textAlign: 'center' }}
                    >
                        <h1>Contact Us</h1>
                        <div
                            className="line"
                            style={{
                                margin: '1rem auto',
                                width: '80px',
                                height: '3px',
                                background: 'white',
                            }}
                        ></div>
                        <p style={{ color: 'white' }}>
                            Have a question or need assistance? Leave your contact details and
                            we’ll get back to you shortly.
                        </p>

                    </div>
                </div>
            </section>

            <main>
                <section
                    className="form-section"
                    style={{
                        maxWidth: '600px',
                        margin: '2rem auto',
                        padding: '2rem',
                        background: 'white',
                        borderRadius: '12px',
                        boxShadow: '0 4px 10px rgba(0, 0, 0, 0.1)',
                    }}
                >
                    <h2 style={{ textAlign: 'center', marginBottom: '1rem' }}>
                        Get in Touch
                    </h2>

                    <form onSubmit={handleSubmit}>
                        <div className="form-group">
                            <label htmlFor="name">Full Name</label>
                            <input
                                type="text"
                                id="name"
                                name="name"
                                value={formData.name}
                                onChange={handleChange}
                                required
                            />
                        </div>
                        <div className="form-group">
                            <label htmlFor="email">Email Address</label>
                            <input
                                type="email"
                                id="email"
                                name="email"
                                value={formData.email}
                                onChange={handleChange}
                                required
                            />
                        </div>
                        <div className="form-group">
                            <label htmlFor="message">Your Message</label>
                            <textarea
                                id="message"
                                name="message"
                                rows="5"
                                value={formData.message}
                                onChange={handleChange}
                                required
                            ></textarea>
                        </div>
                        <button
                            type="submit"
                            className="search-btn"
                            style={{ marginTop: '1rem' }}
                        >
                            Send Message
                        </button>
                    </form>

                    {status && (
                        <p style={{ marginTop: '1rem', color: status.startsWith('✅') ? 'green' : 'red' }}>
                            {status}
                        </p>
                    )}

                    <div
                        className="contact-info"
                        style={{
                            marginTop: '2rem',
                            paddingTop: '1rem',
                            borderTop: '1px solid var(--border-color)',
                        }}
                    >
                        <h3>Other Ways to Reach Us</h3>
                        <p>📍 Nairobi, Kenya</p>
                        <p>📞 +254 712 345678</p>
                        <p>✉️ support@skyconnect.com</p>
                    </div>
                </section>
            </main>

            <Footer />
        </>
    );
}

