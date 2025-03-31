const boxes = document.querySelectorAll(".box");
const fill = document.querySelector(".fill");
fill.ondragend = function () {
  this.classList.add("fill");
};
fill.ondragstart = function () {
  setTimeout(() => {
    this.classList = "invisible";
  }, 0);
};

boxes.forEach((box) => {
  box.ondragenter = function () {
    this.classList.add("hovered");
  };
  box.ondragleave = function (ev) {
    ev.preventDefault();
    this.classList.remove("hovered");
  };
  box.ondragover = (ev) => {
    ev.preventDefault();
  };
  box.ondrop = function (ev) {
    this.appendChild(fill);
    this.classList.remove("hovered");
  };
});
