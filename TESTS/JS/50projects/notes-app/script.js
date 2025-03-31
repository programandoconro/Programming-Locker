const addNoteButton = document.querySelector(".add-note");
const body = document.querySelector("body");

const notes = JSON.parse(localStorage.getItem("notes"));

if (notes) {
  notes.forEach((note) => addNote(note));
}

addNoteButton.addEventListener("click", () => addNote());

function addNote(text = "") {
  const noteEl = document.createElement("div");
  noteEl.classList.add("note");

  const note = `
      <div class="header">
        <button class="delete"><i class="fa fa-trash-o"></i></button>
        <button class="edit"><i class="fa fa-edit"></i></button>
      </div>
      <textarea class="textarea"></textarea>
    `;

  noteEl.innerHTML = note;

  const textArea = noteEl.querySelector("textarea");

  textArea.value = text;

  textArea.addEventListener("input", (e) => {
    updateLocalStorage();
  });

  body.appendChild(noteEl);
  const deleteButton = noteEl.querySelector(".delete");
  deleteButton.addEventListener("click", () => {
    noteEl.remove();
  });
}

function deleteNote() {
  console.log(this.parentNode);
}

function updateLocalStorage() {
  const textareas = document.querySelectorAll("textarea");

  const notes = [];
  textareas.forEach((note) => {
    notes.push(note.value);
  });

  localStorage.setItem("notes", JSON.stringify(notes));
}
