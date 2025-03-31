const rightSlider = document.querySelector(".right-slider");
const leftSlider = document.querySelector(".left-slider");

const container = document.querySelector(".container");
const buttonUp = document.querySelector(".up");
const buttonDown = document.querySelector(".down");

const slidesLength = rightSlider.querySelectorAll("div").length;
let index = 0;

leftSlider.style.top = `-${(slidesLength - 1) * 100}vh`;

buttonDown.addEventListener("click", () => moveSlides("down"));
buttonUp.addEventListener("click", () => moveSlides("up"));

const moveSlides = (dir) => {
  const sliderHeight = container.clientHeight;

  if (dir === "up") {
    index++;
    if (index > slidesLength - 1) {
      index = 0;
    }
  } else if (dir === "down") {
    index--;
    console.log(index);
    if (index < 0) {
      index = slidesLength - 1;
    }
  }

  rightSlider.style.transform = `translateY(-${index * sliderHeight}px)`;
  leftSlider.style.transform = `translateY(${index * sliderHeight}px)`;
};
