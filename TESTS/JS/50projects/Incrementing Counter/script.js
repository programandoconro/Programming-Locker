const counters = document.querySelectorAll(".counter");

counters.forEach((counter) => {
  counter.innerText = "0";
  function updateCounter() {
    i = +counter.innerText;

    const target = counter.getAttribute("data-target");

    const increment = target / 200;

    if (i < target) {
      counter.innerText = `${Math.ceil(i + increment)}`;
      setTimeout(() => {
        updateCounter();
      }, 1);
    }
  }
  updateCounter();
});
