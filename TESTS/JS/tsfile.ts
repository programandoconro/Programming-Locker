type Props = {
  optionA: string;
  optionB?: string;
};

const myFunctionA = (): Props => {
  const result: Props = { optionA: "hola", optionB: "chao" };
  debugger;
  return result; // noerror
};

const myFunctionB = (): Props => {
  const result = { optionA: "hola", optionC: "chao" };
  debugger;
  return result; // noerror
};

const myFunctionC = (): Props[] => {
  console.log("My function D");

  return [...new Array(3)].map((_, index) => ({
    optionA: String(index),
    optionC: "hola",
  })); // no error
};

console.log(myFunctionA());
debugger;
console.log(myFunctionB());
debugger;
console.log(myFunctionC());
debugger;
