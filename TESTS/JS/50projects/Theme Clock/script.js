const [hourNeedle, minuteNeedle, secondNeedle] =
  document.querySelectorAll(".needle");

const scale = (num, in_min, in_max, out_min, out_max) => {
  return ((num - in_min) * (out_max - out_min)) / (in_max - in_min) + out_min;
};

const setTime = () => {
  const date = new Date();
  const hour = date.getHours();
  const minute = date.getMinutes();
  const second = date.getSeconds();

  hourNeedle.style = `transform: translate(-50%, -100%) rotate(${scale(
    hour,
    0,
    11,
    0,
    360
  )}deg);`;
  minuteNeedle.style = `transform: translate(-50%, -100%) rotate(${scale(
    minute,
    0,
    59,
    0,
    360
  )}deg);`;
  secondNeedle.style = `transform: translate(-50%, -100%) rotate(${scale(
    second,
    0,
    59,
    0,
    360
  )}deg);`;
};

setInterval(setTime, 1000);
