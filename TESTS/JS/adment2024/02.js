const { open } = require("node:fs/promises");

const getData = async () => {
  const file = await open("./02.txt");
  const levels = [];

  for await (let line of file.readLines()) {
    levels.push(line.split(" ").map(Number));
  }

  return levels;
};

const calculateSafeLevel = async () => {
  const levels = await getData();
  let safe = 0;

  for (let level of levels) {
    let isSafe = true;
    let direction = findDirection(level[0], level[1]);

    for (let i = 1; i < level.length; i++) {
      let once = true;
      const notSafeCondition =
        ![1, 2, 3].includes(Math.abs(level[i] - level[i - 1])) ||
        findDirection(level[i - 1], level[i]) !== direction;
      if (notSafeCondition) {
        const newLevel = [...level.slice(0, i), ...level.slice(i + i)];

        for (let j = 1; j < newLevel.length; j++) {
          const notSafeCondition =
            ![1, 2, 3].includes(Math.abs(level[j] - level[j - 1])) ||
            findDirection(level[j - 1], level[j]) !== direction;

          if (notSafeCondition && once) {
            isSafe = false;
          }
        }
      }
    }
    if (isSafe) {
      safe++;
    }
  }
  console.log(safe);
};

calculateSafeLevel();

function findDirection(a, b) {
  return a > b ? "dec" : "inc";
}
