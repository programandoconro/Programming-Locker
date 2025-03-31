const buttons = document.querySelectorAll("button");
const faq = document.querySelectorAll(".faq");

buttons.forEach((button, index) => {
  button.addEventListener("click", () => {
    faq[index].classList.toggle("active");
  });
});
