const myMap = <T, U>(arr: T[]) => (callback: (val: T, index: number, arr: T[])=> U) =>{
    const result = []
    for (let i =0; i< arr.length; i++){
        result.push(callback(arr[i], i, arr)) 
    }
    return result;
}

const myArrFn = myMap([1,2,3]);
const result = myArrFn(((val)=> val*2));

console.log(result); // [2, 4, 6]
