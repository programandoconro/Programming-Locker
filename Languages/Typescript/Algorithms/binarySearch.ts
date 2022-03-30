console.log("my binary search first try");

let testArr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
let testKeys = Object.keys(testArr);

type InputType = {
  values: number[];
  keys: string[];
};

function conquer(left: InputType, right: InputType, target: number): InputType {
  if (right.values[0] <= target) {
    if (right.values[0] === target) {
      return { values: [right.values[0]], keys: [right.keys[0]] };
    }
    return { values: right.values, keys: right.keys };
  } else {
    if (left.values[0] === target) {
      return { values: [left.values[0]], keys: [left.keys[0]] };
    }

    return { values: left.values, keys: left.keys };
  }
}

function binarySearch(arr: InputType, target: number) {
  if (arr.values.length <= 1) {
    console.log(arr);
    return [arr];
  }

  const mid = arr.values.length / 2;

  const left = arr.values.splice(0, mid);
  const leftKeys = arr.keys.splice(0, mid);

  binarySearch(conquer({ values: left, keys: leftKeys }, arr, target), target);
}

console.time("start");
binarySearch({ values: testArr, keys: testKeys }, Number(7));
console.timeEnd("start");

// { values: [ 7 ], keys: [ '6' ] }
