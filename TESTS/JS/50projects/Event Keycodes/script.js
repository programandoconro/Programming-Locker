const container = document.querySelector(".container");

window.addEventListener("keydown", (key) => {
  container.innerHTML = `
    <div class="key">
    ${key.key === " " ? "Space" : key?.key}
    <small>key.key</small>
  </div>
  <div class="key">
    ${key?.keyCode}
    <small>key.keyCode</small>
  </div>
  <div class="key">
    ${key?.code}
    <small>key.code</small>
  </div>
    `;
});
