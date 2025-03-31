console.log("init");

const container = document.getElementById("container");

const menuButton = document.getElementById("menu-button");

let rotated = false;
const handleRotation = () => {
  console.log("hola");
  if (!rotated) {
    container.classList.add("rotated");
    menuButton.classList.add("rotated-menu");
    rotated = true;
  } else {
    container.classList.remove("rotated");
    menuButton.classList.remove("rotated-menu");
    rotated = false;
  }
};

menuButton.addEventListener("click", handleRotation);
