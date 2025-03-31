const body = document.querySelector("body");
const password = document.getElementById("password");

let passwordLength = 0;
const maxBlur = 16;

password.addEventListener("input", (event) => {
  passwordLength = event.target?.value.length * 2;
  if (passwordLength > maxBlur) {
    passwordLength = maxBlur;
  }
  body.style = `backdrop-filter: blur(${maxBlur - passwordLength}px);`;
});
