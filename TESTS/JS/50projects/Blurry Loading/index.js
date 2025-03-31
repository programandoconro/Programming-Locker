const body = document.querySelector("body");
const cards = document.querySelectorAll(".card-container");

const scrollListener = () => {
  const y = (window.innerHeight / 5) * 4;

  cards.forEach((card, index) => {
    const cardLenght = card.getBoundingClientRect().top;
    if (y > cardLenght) {
      card.style.transform = "translateX(0%)";
    } else {
      if (index % 2) {
        card.style.transform = "translateX(400%)";
      } else {
        card.style.transform = "translateX(-400%)";
      }
    }
  });
};
scrollListener();

window.addEventListener("scroll", scrollListener);
window.addEventListener("resize", scrollListener);
