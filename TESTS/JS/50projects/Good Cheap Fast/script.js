const switchButtons = document.querySelectorAll(".switch-button");
const switches = document.querySelectorAll(".switch");

const states = [false, false, false];

switchButtons.forEach((button, index) => {
  button.addEventListener("click", () => handleSwitch(button, index));
});

function handleSwitch(button, index) {
  states[index] = !states[index];

  const state = states[index];

  if (state) {
    switches[index].style = "transform: translateX(40px);";
    button.style = "background-color: purple;";
  } else {
    switches[index].style = "transform: translateX(0);";
    button.style = "background-color: lightgray;";
  }
}
