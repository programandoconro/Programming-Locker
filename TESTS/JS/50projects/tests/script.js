const form = document.querySelector("form");
const input = document.querySelector("input");

function onSubmit() {
  alert("submit");
}

form.addEventListener("submit", () => {
  onSubmit();
});
