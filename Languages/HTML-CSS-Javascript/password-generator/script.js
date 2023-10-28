const password = document.getElementById("password");
const length = document.getElementById("length");
const uppercase = document.getElementById("uppercase");
const lowercase = document.getElementById("lowercase");
const numbers = document.getElementById("numbers");
const symbols = document.getElementById("symbols");
const generate = document.getElementById("generate");
const clipboard = document.getElementById("clipboard");

const lettersLowercase = "qwertyuiopasdfghjklzxcvbnm".split("");
const lettersUppercase = "QWERTYUIOPASDFGHJKLZXCVBNM".split("");
const numbersArray = "1234567890".split("");
const symbolsArray = "!@#$%^&*()_+=-[];',./?><:}|{".split("");

generate.addEventListener("click", () => {
  generatePassword(lettersLowercase);
});

function generatePassword() {
  const passwordArray = [];
  password.innerText = "";
  const earlyReturn =
    !uppercase.checked &&
    !lowercase.checked &&
    !numbers.checked &&
    !symbols.checked;

  if (earlyReturn) return;

  if (uppercase.checked) {
    lettersUppercase.forEach((letter) => {
      passwordArray.push(letter);
    });
  }
  if (lowercase.checked) {
    lettersLowercase.forEach((letter) => {
      passwordArray.push(letter);
    });
  }
  if (numbers.checked) {
    numbersArray.forEach((letter) => {
      passwordArray.push(letter);
    });
  }
  if (symbols.checked) {
    symbolsArray.forEach((letter) => {
      passwordArray.push(letter);
    });
  }

  for (let i = 0; i < length.value; i++) {
    const randomChar = chooseRandom(passwordArray);
    password.innerText += randomChar;
  }
}

function chooseRandom(arr) {
  const randomIndex = Math.floor(Math.random(arr.length - 1) * arr.length);
  const randomValue = arr[randomIndex];
  return randomValue;
}

clipboard.addEventListener("click", () => {
  updateClipboard(password.innerText);
});

function updateClipboard(newClip) {
  navigator.clipboard.writeText(newClip).then(
    () => {
      alert("Copied to clipboard!");
    },
    () => {
      alert("Failed to copy to clipboard");
    }
  );
}
