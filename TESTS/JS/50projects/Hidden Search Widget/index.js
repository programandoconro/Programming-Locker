const search = document.querySelector(".search");
const icon = document.querySelector("i");

icon.addEventListener("click", () => {
  if (search.classList.contains("invisible")) {
    search.classList.add("visible");
    icon.classList.add("visible");
    search.classList.remove("invisible");
    icon.classList.remove("invisible");
  } else {
    search.classList.add("invisible");
    icon.classList.add("invisible");
    search.classList.remove("visible");
    icon.classList.remove("visible");
  }
});
