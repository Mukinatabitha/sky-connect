const form = document.getElementById("paymentForm");
const modal = document.getElementById("confirmModal");
const confirmYes = document.getElementById("confirmYes");
const confirmNo = document.getElementById("confirmNo");

form.addEventListener("submit", function (e) {
  e.preventDefault();
  modal.style.display = "flex"; // Show modal
});

confirmYes.addEventListener("click", function () {
  modal.style.display = "none";
  alert("Payment Successful!");
  window.location.href = "confirmation.html";
});

confirmNo.addEventListener("click", function () {
  modal.style.display = "none"; // Hide modal
});
