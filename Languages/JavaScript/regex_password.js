console.log("please input an alphanumeric password greater than 8 digits with at least one uppercase");

const askPassword = () => {
  const readline = require("readline").createInterface({
    input: process.stdin,
    output: process.stdout,
  });
  readline.question("password: ", (password) => {
    const passCheck = /^(?=.*[0-9])(?=.*[A-Z])(?=.*[a-z])([a-zA-Z0-9]+){8,}$/; 

    if (password.match(passCheck)) {
      console.log("password approved");

      console.log(`${password}!`);
    } else {
      console.log("not matching conditions");
    }

    readline.close();
    askPassword();
  });
};

askPassword();

