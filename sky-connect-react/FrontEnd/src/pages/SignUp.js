// SignUp.js (React frontend component)
import React, { useState } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import '../styles/SignUp.css';

export default function SignUp() {
    const [showPassword, setShowPassword] = useState(false);
    const [showConfirmPassword, setShowConfirmPassword] = useState(false);
    const [error, setError] = useState('');
    const [formData, setFormData] = useState({
        name: '',
        email: '',
        password: '',
        confirm_password: ''
    });

    const navigate = useNavigate();

    const togglePassword = () => setShowPassword(prev => !prev);
    const toggleConfirmPassword = () => setShowConfirmPassword(prev => !prev);

    const handleChange = (e) => {
        const { name, value } = e.target;
        setFormData(prev => ({ ...prev, [name]: value }));
    };

    const handleSubmit = async (e) => {
        e.preventDefault();
        setError('');

        try {
            const response = await fetch('http://localhost/SkyConnect/BackEnd/signup.php', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                credentials: 'include',
                body: JSON.stringify(formData)
            });

            const result = await response.json();

            if (result.success) {
                navigate(`/index.html?name=${encodeURIComponent(result.name)}`);
            } else {
                setError(result.message || 'Signup failed.');
            }
        } catch (err) {
            setError('Something went wrong. Please try again.');
            console.error(err);
        }
    };

    return (
        <div className="signup-container">
            <div className="image-container"></div>
            <div className="signup-box">
                <p>Your next adventure starts here.<br />Create your account and unlock the world!</p>
                <img
                    src="https://raw.githubusercontent.com/Mukinatabitha/sky-connect/main/skyconnect-logo.png"
                    alt="Flight Icon"
                />
                <hr />
                <h2>Sign Up</h2>

                {error && <div className="error-message">{error}</div>}

                <form onSubmit={handleSubmit}>
                    <input
                        type="text"
                        name="name"
                        placeholder="Name"
                        value={formData.name}
                        onChange={handleChange}
                        required
                    />
                    <input
                        type="email"
                        name="email"
                        placeholder="Email"
                        value={formData.email}
                        onChange={handleChange}
                        required
                    />

                    <div className="password-container">
                        <input
                            type={showPassword ? 'text' : 'password'}
                            name="password"
                            placeholder="Password"
                            value={formData.password}
                            onChange={handleChange}
                            required
                        />
                        <button
                            type="button"
                            className="toggle-password"
                            onClick={togglePassword}
                        >
                            <i className={`fas ${showPassword ? 'fa-eye-slash' : 'fa-eye'}`}></i>
                        </button>
                    </div>

                    <div className="password-container">
                        <input
                            type={showConfirmPassword ? 'text' : 'password'}
                            name="confirm_password"
                            placeholder="Confirm Password"
                            value={formData.confirm_password}
                            onChange={handleChange}
                            required
                        />
                        <button
                            type="button"
                            className="toggle-password"
                            onClick={toggleConfirmPassword}
                        >
                            <i className={`fas ${showConfirmPassword ? 'fa-eye-slash' : 'fa-eye'}`}></i>
                        </button>
                    </div>

                    <input type="submit" value="Sign Up" />
                </form>

                <div className="signin-link">
                    Already have an account?
                    <Link to="/signin">Sign in here</Link>
                </div>
            </div>
        </div>
    );
}
