var flat = function (arr, n) {
  
  let result = [];
  recursive(arr, n, result);

  return result;

};

const recursive = (arr, depth, result) => {
    if (depth >= 0 && Array.isArray(arr)) {
        arr.map(val => recursive(val, depth-1, result));
    }
    else {
      result.push(arr);
  }
};

const input = [1,2,3,[4,5,6],[7,8,[9,10,11],12],[13,14,15]]
const solution = flat(input, 1);
const expected = [1,2,3,4,5,6,7,8,[9,10,11],12,13,14,15]

const correct = JSON.stringify(expected) === JSON.stringify(solution);

console.log({input, correct, solution, expected })

