function decode(message = "") {
  if (!message.includes("(")) return message;

  const regex = /\(([^()]*)\)/g;

  const arr = message.match(regex);

  for (let founded of arr) {
    const reversed = reverseString(founded).replace(/\(|\)/g, "");
    const newMessage = message.replace(founded, reversed);
    message = decode(newMessage);
  }

  return message;
}

function reverseString(str = "") {
  let result = "";
  for (let i = str.length - 1; i >= 0; i--) {
    result += str[i];
  }
  return result;
}
const a = decode("hola (odnum)");
console.log(a); // hola mundo

const b = decode("(olleh) (dlrow)!");
console.log(b); // hello world!

const c = decode("sa(u(cla)atn)s");
console.log(c); // santaclaus
