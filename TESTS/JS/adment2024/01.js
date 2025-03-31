const { open } = require("node:fs/promises");

const path = "./01_data.txt";

async function getLinesColumns(path) {
  const file = await open(path);
  const leftList = [];
  const rightList = [];
  for await (let line of file.readLines()) {
    const locations = line.split("   ");
    const leftLocation = locations[0];
    const rightLocation = locations[1];
    leftList.push(leftLocation);
    rightList.push(rightLocation);
  }

  return [leftList, rightList];
}

async function getDistanceDifferences() {
  const [leftList, rightList] = await getLinesColumns(path);
  const sortedLeft = leftList.sort((a, b) => a - b);
  const sortedRight = rightList.sort((a, b) => a - b);

  let distance = 0;

  for (let i = 0; i < sortedLeft.length; i++) {
    distance += Math.abs(sortedLeft[i] - sortedRight[i]);
  }
  console.log(distance);
}

// getDistanceDifferences();
//

async function findSimilarity() {
  const [leftList, rightList] = await getLinesColumns(path);
  let similarity = 0;

  for (let i = 0; i < leftList.length; i++) {
    const currentLeft = leftList[i];

    for (let j = 0; j < rightList.length; j++) {
      const currentRight = rightList[j];

      if (currentLeft === currentRight) {
        similarity += Number(currentLeft);
      }
    }
  }

  console.log(similarity);
}

findSimilarity();
