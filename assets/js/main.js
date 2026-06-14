document.addEventListener("DOMContentLoaded", function () {
  const year = document.getElementById("year");
  if (year) year.textContent = new Date().getFullYear();

  const copyButtons = document.querySelectorAll("[data-copy]");
  copyButtons.forEach((btn) => {
    btn.addEventListener("click", async () => {
      const target = document.querySelector(btn.getAttribute("data-copy"));
      if (!target) return;
      try {
        await navigator.clipboard.writeText(target.innerText.trim());
        const old = btn.innerText;
        btn.innerText = "Copied!";
        setTimeout(() => (btn.innerText = old), 1600);
      } catch (e) {
        alert("Gagal copy command.");
      }
    });
  });
});

