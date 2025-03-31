const backgrounds = document.querySelectorAll(".square");
const [prev, next] = document.querySelectorAll("button");
const body = document.querySelector("body");

let counter = 0;

next.addEventListener("click", () => {
  counter++;
  if (counter > backgrounds.length - 1) {
    counter = 0;
  }
  setBackground(counter);
});
prev.addEventListener("click", () => {
  counter--;
  if (counter < 0) {
    counter = backgrounds.length - 1;
  }
  setBackground(counter);
});

function setBackground(ind) {
  backgrounds.forEach((background, index) => {
    if (ind === index) {
      background.classList.add("active");

      body.style.backgroundImage = background.style.backgroundImage;
    } else {
      background.classList.remove("active");
    }
  });
}
