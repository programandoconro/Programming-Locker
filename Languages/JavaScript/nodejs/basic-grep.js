/**
  Program to search a word in a file, like basic grep.
  For example, `node basic-grep.js history.txt docker`,
  will search the word `docker` inside the history.txt file. 
**/

import { readFile } from "node:fs/promises";
import chalk from "chalk";

const main = async () => {
  let text;
  const [file, word] = getArgs();
  if (!file || !word) {
    throw new Error("need to supply file and search word");
    process.exit(1);
  }
  try {
    text = await readFile(file, "utf-8");
  } catch (error) {
    if (error.code === "ENOENT") {
      console.log("Not such file in path");
      process.exit(1);
    } else {
      throw error;
    }
  }
  const history = text.split("\n");

  searchWord(history, word);
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

const getWordIndexes = (indexes, len) => {
  const result = [];

  indexes.forEach((index) => {
    for (let i = 0; i < len; i++) {
      result.push(index + i);
    }
  });

  return result;
};

const getArgs = () => {
  const args = process.argv.splice(2);

  return args;
};

main();
