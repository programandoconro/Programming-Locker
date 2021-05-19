//This function takes an object as input and returns a new object with same keys but suffled values.

const obj = { 0: "表現", 1: "変", 3: "基本" };

const uniqueRandomGenerator = (o) => {
  const keys = Object.keys(o);
  let result = {};
  const randomSet = new Set();
  while (randomSet.size !== keys.length) {
    randomSet.add(Math.floor(Math.random() * keys.length));
  }

  const randomList = [...randomSet];
  const values = Object.values(o);
  keys.map((k) => {
    result[k] = values[randomList.pop()];
  });

  return result;
};

console.log(uniqueRandomGenerator(obj));


