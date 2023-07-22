// Program to filter lines of a file that include a word and paint the match. Like basic grep command.
// TODO add cli input

import { readFile } from "node:fs/promises";
import chalk from "chalk";

const main = async () => {
  let text;
  try {
    text = await readFile("history.txt", "utf-8");
  } catch (error) {
    if (error.code === "ENOENT") {
      console.log("Not such file in path");
      return
    } else {
      throw error;
    }
  }
  const history = text.split("\n");

  searchWord(history, "node");
};

const searchWord = (arr, word) => {
  arr.forEach((line) => {
    if (line.includes(word)) {
      paintWord(line, word);
    }
  });
};

const paintWord = (text, searchWord) => {
  const matches = [...text.matchAll(new RegExp(searchWord, "gi"))];
  const startIndexes = matches.map((match) => match.index);
  const indexes = getWordIndexes(startIndexes, searchWord.length);

  let word = "";
  text.split("").forEach((letter, index) => {
    if (indexes.includes(index)) {
      word += chalk.blue(letter);
    } else {
      word += letter;
    }
  });
  console.log(word);
};

const getWordIndexes = (indices, len) => {
  const result = [];

  indices.forEach((index) => {
    for (let i = 0; i < len; i++) {
      result.push(index + i);
    }
  });

  return result;
};

main();
