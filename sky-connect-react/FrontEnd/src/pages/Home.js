import '../styles/Home.css';
import React from 'react';
import Header from '../components/Header';
import Hero from '../components/Hero';
import SearchForm from '../components/SearchForm';
import Footer from '../components/Footer';

export default function Home() {
    const urlParams = new URLSearchParams(window.location.search);
    const name = urlParams.get("name");

    return (
        <>
            {name && (
                <div style={{
                    background: "#2c7a92",
                    color: "white",
                    padding: "12px",
                    textAlign: "center",
                    fontWeight: "bold",
                    fontSize: "18px"
                }}>
                    🎉 Welcome to SkyConnect, {decodeURIComponent(name)}!
                </div>
            )}
            <Header name={name} />
            <main>
                <Hero />
                <SearchForm />
            </main>
            <Footer />
        </>
    );
}
