const canvas = document.querySelector("canvas");
const ctx = canvas.getContext("2d");
const clear = document.querySelector(".clear");
const colorPicker = document.querySelector(".color");
const increase = document.querySelector(".increase");
const decrease = document.querySelector(".decrease");
const fontEl = document.querySelector(".font-size");

colorPicker.value = "black";
let color = colorPicker.value;
let fontSize = 5;
let x;
let y;
let isMouseDown = false;

const drawCircle = (x, y) => {
  ctx.beginPath();
  ctx.arc(x, y, fontSize, 0, Math.PI * 2);
  ctx.fillStyle = color;

  ctx.fill();
};

function drawLine(x1, y1, x2, y2) {
  ctx.beginPath();
  ctx.moveTo(x1, y1);
  ctx.lineTo(x2, y2);
  ctx.strokeStyle = color;
  ctx.lineWidth = fontSize * 2;
  ctx.stroke();
}

canvas.addEventListener("mousedown", (e) => {
  isMouseDown = true;
  x = e.offsetX;
  y = e.offsetY;
});
canvas.addEventListener("mouseup", () => {
  isMouseDown = false;
  x = undefined;
  y = undefined;
});

canvas.addEventListener("mousemove", (e) => {
  if (isMouseDown) {
    x2 = e.offsetX;
    y2 = e.offsetY;

    drawCircle(x2, y2);
    drawLine(x, y, x2, y2);

    x = x2;
    y = y2;
  }
});

colorPicker.addEventListener("change", (e) => {
  color = e.target.value;
});

clear.addEventListener("click", () =>
  ctx.clearRect(0, 0, canvas.width, canvas.height)
);

increase.addEventListener("click", () => {
  fontSize++;

  if (fontSize > 50) {
    fontSize = 50;
  }
  updateFontSize();
});

decrease.addEventListener("click", () => {
  fontSize--;

  if (fontSize < 5) {
    fontSize = 5;
  }
  updateFontSize();
});

const updateFontSize = () => {
  fontEl.innerText = fontSize;
};
