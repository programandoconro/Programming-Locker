// Inspired by Jack Herrington (https://www.youtube.com/watch?v=Q4QDyr0jLfo&t=2s)

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
  
console.log(counter()); // 0

setCounter(counter() + 1);

console.log(counter()); // 1
