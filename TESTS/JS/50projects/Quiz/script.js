const questions = document.querySelectorAll(".card");
const allInput = document.querySelectorAll("input");

const correctAnswersIndexes = [3, 1, 0, 1];
let userAnswers = [];
let index = 0;

questions.forEach((question, questionIndex) => {
  question.querySelector("button").addEventListener("click", () => {
    index++;
    if (index > questions.length - 1) {
      resetAllInputs(allInput);
      alert(compareArrays(correctAnswersIndexes, userAnswers));
      index = 0;
      userAnswers = [];
    }
    removeActiveClasses();
    questions[index].classList.add("active");
  });
  const inputs = question.querySelectorAll("input");
  inputs.forEach((input, activeCheckboxIndex) => {
    input.addEventListener("change", () => {
      resetInputs(inputs, activeCheckboxIndex);
      if (input.checked) {
        userAnswers[questionIndex] = activeCheckboxIndex;
      }
    });
  });
});

function removeActiveClasses() {
  questions.forEach((question) => {
    question.classList.remove("active");
  });
}

function resetAllInputs(inputs) {
  inputs.forEach((input) => {
    input.checked = false;
  });
}

function resetInputs(inputs, activeCheckboxIndex) {
  inputs.forEach((input, currentCheckboxIndex) => {
    if (currentCheckboxIndex !== activeCheckboxIndex) {
      input.checked = false;
    }
  });
}

function compareArrays(a, b) {
  let corrects = 0;
  a.forEach((valA, aIndex) => {
    if (valA === b[aIndex]) {
      corrects++;
    }
  });
  return `${corrects}/${a.length}`;
}
