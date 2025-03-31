type Board = Vec<Vec<String>>;

pub fn create_board(flipped: bool) -> Board {
    let mut board: Board = Vec::new();
    let mut columns: Vec<char> = vec!['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h'];
    let mut rows: Vec<char> = vec!['1', '2', '3', '4', '5', '6', '7', '8'];

    if flipped {
        columns = columns.into_iter().rev().collect();
        rows = rows.into_iter().rev().collect();
    }
    for row in rows {
        board.push(Vec::new());
        for column in &columns {
            let mut square = String::new();
            square.push(*column);
            square.push(row);
            let len: usize = board.len();
            board[len - 1].push(square);
        }
    }

    board
}
