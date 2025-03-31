const measureTime = (fn: () => void) => {
  return (delay: number) => {
    const start = performance.now();
    setTimeout(() => {
      fn();
      const end = performance.now();

      console.log(end - start);
    }, delay);
  };
};

const say = () => {
  console.log("ehllo");
};

measureTime(say)(5000);

