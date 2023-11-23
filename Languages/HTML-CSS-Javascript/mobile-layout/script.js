const tabs = document.querySelectorAll(".fa");
const images = document.querySelectorAll(".image");

tabs.forEach((tab, index) => {
  tab.addEventListener("click", () => {
    resetImages();
    tab.classList.add("active");
    images[index].classList.add("active");
  });
});

function resetImages() {
  images.forEach((image, index) => {
    image.classList.remove("active");
    tabs[index].classList.remove("active");
  });
}
