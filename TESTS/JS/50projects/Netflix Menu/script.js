const buttonOpen = document.querySelector(".open");
const buttonClose = document.querySelector(".close");
const menu = document.querySelector(".menu");
const black = document.querySelector(".black");
const red = document.querySelector(".red");
const white = document.querySelector(".white");

buttonOpen.addEventListener("click", () => {
  menu.classList.add("active");
  black.classList.add("active");
  red.classList.add("active");
  white.classList.add("active");
});
buttonClose.addEventListener("click", () => {
  menu.classList.remove("active");
  black.classList.remove("active");
  red.classList.remove("active");
  white.classList.remove("active");
});
