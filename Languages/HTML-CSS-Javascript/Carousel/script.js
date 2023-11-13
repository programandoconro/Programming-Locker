const images = document.querySelectorAll(".image");
const container = document.querySelector(".container");

let index = 0;
let lastIndex = images.length - 1;

const activateEachImage = () => {
  container.style = `transform: translateX(${-index * 500}px);`;
  index++;
  if (index > lastIndex) {
    index = 0;
  }
};

setInterval(activateEachImage, 2000);
