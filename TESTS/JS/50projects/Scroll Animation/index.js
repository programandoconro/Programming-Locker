const left = document.getElementById("left");
const right = document.getElementById("right");

left.addEventListener("mouseenter", () => {
  left.classList.add("mouse-in");
  right.classList.remove("mouse-in");
});
right.addEventListener("mouseenter", () => {
  right.classList.add("mouse-in");
  left.classList.remove("mouse-in");
});

document.addEventListener("mouseleave", () => {
  right.classList.remove("mouse-in");
  left.classList.remove("mouse-in");
});
