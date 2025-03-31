const { open } = require("node:fs/promises");

const getData = async () => {
  const path = "./03.txt";

  const file = await open(path);
  let data = "";

  for await (let line of file.readLines()) {
    data += line;
  }

  return data;
};

async function getCorrectMult() {
  const data = await getData();

  const regex = /(?<!don't|do.*)mul\([0-9]{1,3},[0-9]{1,3}\)/g;

  const matches = data.matchAll(regex);

  let sum = 0;

  for (let match of matches) {
    const exp = match[0];

    const clean = exp.replace(/[mul\(\)]/g, "");

    const [left, right] = clean.split(",");

    sum += Number(left) * Number(right);
  }

  return sum;
}

const result = async () => console.log(await getCorrectMult());

result();
