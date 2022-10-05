/* 
  * This code shows an example of a generator with JavaScript.
  * It shifts the order of the values in an array until they return to their original positions.
*/
const array1 = [1, 2, 3];

function* myGenerator(){
  array1.push(array1.shift());
  yield array1[0];
}

let value = null;

while(value !== 1){
   console.log(array1);
   value = myGenerator().next().value
}
