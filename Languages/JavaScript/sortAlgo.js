const l = 10000;
const createRandomArray = () => {
  for (var a = [], i = 0; i < l; ++i) a[i] = i;

  function shuffle(array) {
    var tmp,
      current,
      top = array.length;
    if (top)
      while (--top) {
        current = Math.floor(Math.random() * (top + 1));
        tmp = array[current];
        array[current] = array[top];
        array[top] = tmp;
      }
    return array;
  }

  return shuffle(a);
};

const measurePerformance = (fn) => {
  const start = performance.now();
  console.log(fn());
  const end = performance.now();
  console.log({ performance: end - start });
};

const sortTry1 = (array) => {
  let result = [];

  //find minimum push it and remove it from array

  while (array.length) {
    let minimum = array[0];
    array.forEach((v) => {
      if (v < minimum) {
        minimum = v;
      }
    });

    array.splice(array.indexOf(minimum), 1);
    result.push(minimum);
  }

  return result;
};

measurePerformance(() => sortTry1(createRandomArray()));

function merge(left, right) {
  let arr = [];
  while (left.length && right.length) {
    if (left[0] < right[0]) {
      arr.push(left.shift());
    } else {
      arr.push(right.shift());
    }
  }

  return [...arr, ...left, ...right];
}
function mergeSort(array) {
  const half = array.length / 2;

  if (array.length < 2) {
    return array;
  }

  const left = array.splice(0, half);

  return merge(mergeSort(left), mergeSort(array));
}
measurePerformance(() => mergeSort(createRandomArray()));

const quickSort = (a) => {
  if (a.length <= 1) {
    return a;
  }

  let pivot = a[a.length - 1];

  let left = [];
  let right = [];

  for (ele of a.slice(0, a.length - 1)) {
    ele < pivot ? left.push(ele) : right.push(ele);
  }

  return [...quickSort(left), pivot, ...quickSort(right)];
};

measurePerformance(() => quickSort(createRandomArray()));
