const buttons = document.querySelectorAll("button");

const sounds = ["applause", "boo", "victory", "tada", "wrong"];

buttons.forEach((button, index) => {
  button.addEventListener("click", () => {
    const sound = new Audio(
      `https://50projects50days.com/projects/sound-board/sounds/${sounds[index]}.mp3`
    );

    sound.play();
  });
});
