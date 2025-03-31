const button = document.getElementById("btn");
const toasts = document.getElementById("toasts");

button.addEventListener("click", handleClick);

let times = 0;
async function handleClick() {
  const message = document.createElement("div");
  message.classList.add("message");
  times = toasts.children.length + 1;
  message.innerText = `Message ${times}`;
  toasts.appendChild(message);
  console.log(toasts);

  await pause(3000);
  message.remove();
}

const pause = (ms) => {
  return new Promise((resolve) => setTimeout(resolve, ms));
};
