
const pawn = document.getElementById('pawn-e4');
const board = document.getElementById('board');
let isDragging = false;

const handleMouseDown = () => {
    isDragging = true;
};
const handleMouseUp = () => {
    isDragging = false;
};
const handleMouseMove = (event) => {
    if(isDragging){
       pawn.style.left = `${event.clientX - 20 }px`;
       pawn.style.top = `${event.clientY - 20 }px`;
    }

};
pawn.onmousedown = handleMouseDown;
board.onmouseup = handleMouseUp;
board.onmousemove = handleMouseMove;

