console.log("init");
const useState = <T>(initial: T): [() => T, (v: T) => void] => {
  let val: T = initial;
  return [
    () => val,
    (v: T) => {
      val = v;
    },
  ];
};

const [counter, setCounter] = useState(0);
console.log(counter());

setCounter(counter() + 1);

console.log(counter());
