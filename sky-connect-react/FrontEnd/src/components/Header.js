import React from 'react';
import { Link, useLocation, useNavigate } from 'react-router-dom';
import '../styles/Home.css';

export default function Header({ name }) {
    const location = useLocation();
    const navigate = useNavigate();

    const isActive = (path) => location.pathname === path ? 'active' : '';

    const handleLogout = () => {
        // You can also clear sessionStorage or localStorage here if needed
        navigate('/');
    };

    return (
        <header className="header">
            <div className="container nav">
                <div className="logo" aria-label="SkyConnect Logo">✈️ SkyConnect</div>

                <nav className="nav-links" aria-label="Main Navigation">
                    <Link to="/" className={isActive('/')}>Home</Link>
                    <Link to="/about" className={isActive('/about')}>About</Link>
                    <Link to="/contact" className={isActive('/contact')}>Contact</Link>
                </nav>

                {!name ? (
                    <Link to="/signin" className="sign-in-btn">Sign In</Link>
                ) : (
                    <button
                        onClick={handleLogout}
                        className="sign-in-btn"
                        style={{ marginLeft: '10px' }}
                    >
                        Sign Out
                    </button>
                )}
            </div>
        </header>
    );
}





