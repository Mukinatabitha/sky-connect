// Simple confetti with clouds and plane emojis (or use your own images later)
function launchVisualConfetti() {
    const container = document.createElement('div');
    container.style.position = 'fixed';
    container.style.top = '0';
    container.style.left = '0';
    container.style.width = '100%';
    container.style.height = '100%';
    container.style.pointerEvents = 'none';
    document.body.appendChild(container);

    const icons = ['✈️', '☁️', '🛫', '🛬'];

    for (let i = 0; i < 60; i++) {
        const piece = document.createElement('div');
        piece.textContent = icons[Math.floor(Math.random() * icons.length)];
        piece.style.position = 'absolute';
        piece.style.fontSize = `${Math.random() * 20 + 20}px`;
        piece.style.left = `${Math.random() * 100}%`;
        piece.style.top = '-30px';
        piece.style.animation = `fall ${Math.random() * 3 + 2}s ease-in-out forwards`;
        container.appendChild(piece);
    }
}

// Confetti fall animation
const style = document.createElement("style");
style.textContent = `
@keyframes fall {
    to {
        transform: translateY(100vh) rotate(360deg);
        opacity: 0;
    }
}`;
document.head.appendChild(style);

// Fire on page load
window.onload = () => {
    launchVisualConfetti();
};
