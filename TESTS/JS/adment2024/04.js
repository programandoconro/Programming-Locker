const { open } = require("node:fs/promises");

const getData = async () => {
  const path = "./04_test.txt";

  const file = await open(path);
  const data = [];

  for await (let line of file.readLines()) {
    data.push(line);
  }

  return data;
};

async function countXmas() {
  const data = await getData();

  let count = 0;

  const regex = /XMAS|SAMX/g;
  const joinedHorizontalText = data.join(",");
  console.log(joinedHorizontalText);
  const matches = joinedHorizontalText.matchAll(regex);

  for (let match of matches) {
    console.log(match);
    count++;
  }

  // horizontal
  console.log("[\n  " + data.join(",\n  ") + "\n]");
  console.log(count);

  // vertical
  for (let i = 0; i < data[0].length; i++) {
    let transversed = "";
    for (let j = 0; j < data.length; j++) {
      transversed += data[j][i];
    }
    const match = transversed.match(regex);

    count += match?.length ?? 0;
  }

  const { mainDiagonals, antiDiagonals } = getDiagonals(data);
  const joinedMainDiagonalsText = mainDiagonals.join(",");
  const joinedAntiDiagonalsText = antiDiagonals.join(",");

  const matchesMain = joinedMainDiagonalsText.matchAll(regex);
  const matchesAnti = joinedAntiDiagonalsText.matchAll(regex);

  for (let match of matchesMain) {
    count++;
  }
  for (let match of matchesAnti) {
    count++;
  }

  console.log(mainDiagonals);
  console.log(count);
  return count;
}

countXmas();

function getDiagonals(grid) {
  const n = grid.length;
  const mainDiagonals = [];
  const antiDiagonals = [];

  // Get all main diagonals (↘)
  for (let d = 0; d < 2 * n - 1; d++) {
    const mainDiagonal = [];
    const antiDiagonal = [];
    for (let i = 0; i < n; i++) {
      const jMain = d - i; // Column index for main diagonal
      const jAnti = i - (d - n + 1); // Column index for anti-diagonal

      if (jMain >= 0 && jMain < n) {
        mainDiagonal.push(grid[i][jMain]);
      }
      if (jAnti >= 0 && jAnti < n) {
        antiDiagonal.push(grid[i][jAnti]);
      }
    }
    if (mainDiagonal.length > 0) mainDiagonals.push(mainDiagonal.join(""));
    if (antiDiagonal.length > 0) antiDiagonals.push(antiDiagonal.join(""));
  }

  return { mainDiagonals, antiDiagonals };
}
