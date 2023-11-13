const smallCups = document.querySelectorAll(".small");
const remaining = document.getElementById("remaining");
const percentage = document.getElementById("percentage");

smallCups.forEach((cup, index) => {
  cup.addEventListener("click", () => clickSmallCup(index));
});

const clickSmallCup = (ind) => {
  if (
    smallCups[ind].classList.contains("fill") &&
    (!smallCups[ind].nextElementSibling?.classList.contains("fill") ||
      ind == smallCups.length - 1)
  ) {
    ind--;
  } else {
  }
  smallCups.forEach((cup, index) => {
    if (index <= ind) {
      cup.classList.add("fill");
    } else {
      cup.classList.remove("fill");
    }
  });
  updateBigCup(ind);
};

const updateBigCup = (ind) => {
  const remainingLiters = 2 - (ind + 1) * 0.25;
  if (remainingLiters === 0) {
    remaining.style.visibility = "hidden";
    remaining.style.height = "0px";
    percentage.style.height = "600px";
  } else {
    remaining.style.visibility = "visible";
    remaining.style.height = "0px";
  }
  remaining.innerText = `${remainingLiters} liters remaining`;

  const percentageCup = ((ind + 1) * 500) / 8;

  percentage.style.height = `${percentageCup}px`;

  percentage.innerText = `${((ind + 1) / 8) * 100}%`;
};
