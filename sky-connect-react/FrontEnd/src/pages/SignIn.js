import React, { useState, useEffect } from 'react';
import '../styles/SignIn.css';
import { Link, useLocation, useNavigate } from 'react-router-dom';

export default function SignIn() {
    const [showPassword, setShowPassword] = useState(false);
    const [errorMsg, setErrorMsg] = useState('');
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    const location = useLocation();
    const navigate = useNavigate();

    const togglePassword = () => {
        setShowPassword(prev => !prev);
    };

    useEffect(() => {
        const params = new URLSearchParams(location.search);
        const error = params.get("error");
        if (error) {
            setErrorMsg(decodeURIComponent(error));
        }
    }, [location.search]);

    const handleSubmit = async (e) => {
        e.preventDefault();

        const formData = new FormData();
        formData.append('email', email);
        formData.append('password', password);

        try {
            const response = await fetch('http://localhost:8000/login.php', {
                method: 'POST',
                body: formData,
                credentials: 'include'
            });

            if (response.redirected) {
                const url = new URL(response.url);
                const name = url.searchParams.get("name");
                localStorage.setItem("user_name", name);
                navigate('/');
            } else {
                const text = await response.text();
                setErrorMsg("Login failed. Please check your credentials.");
                console.error(text);
            }
        } catch (err) {
            console.error(err);
            setErrorMsg("Server error. Please try again later.");
        }
    };

    return (
        <div className="container">
            <div className="left-panel"></div>
            <div className="right-panel">
                <h1>Welcome To The SkyConnect Website</h1>
                <img
                    src="/skyconnect-logo.png"
                    alt="SkyConnect Logo"
                    className="logo"
                />

                <div className="divider"><span>Sign In</span></div>

                {errorMsg && (
                    <div className="error-message">{errorMsg}</div>
                )}

                <form onSubmit={handleSubmit}>
                    <div className="input-group">
                        <i className="fas fa-envelope"></i>
                        <input
                            type="email"
                            name="email"
                            placeholder="Email"
                            value={email}
                            onChange={(e) => setEmail(e.target.value)}
                            required
                        />
                    </div>

                    <div className="input-group">
                        <i className="fas fa-lock"></i>
                        <input
                            type={showPassword ? 'text' : 'password'}
                            name="password"
                            placeholder="Password"
                            value={password}
                            onChange={(e) => setPassword(e.target.value)}
                            required
                        />
                        <button type="button" className="toggle-password" onClick={togglePassword}>
                            <i className={`fas ${showPassword ? 'fa-eye-slash' : 'fa-eye'}`} />
                        </button>
                    </div>

                    <div className="login-link">
                        Not registered?
                        <Link to="/signup">Create An Account</Link>
                    </div>

                    <button type="submit" className="login-btn">Login</button>
                </form>
            </div>
        </div>
    );
}