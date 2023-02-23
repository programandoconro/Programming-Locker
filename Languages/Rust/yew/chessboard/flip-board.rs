use yew::prelude::*;

type Board = Vec<Vec<String>>;

fn create_board(flipped: bool) -> Board {
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

#[function_component]
fn App() -> Html {
    let is_flipped = use_state(|| false);

    let onclick: Callback<MouseEvent> = {
        let is_flipped = is_flipped.clone();
        web_sys::console::log_1(&is_flipped.to_string().into());
        Callback::from(move |_| match *is_flipped {
            true => is_flipped.set(false),
            false => is_flipped.set(true),
        })
    };

    let render_squares = |squares: &Vec<String>| -> Html {
        html! {
            <tr>
                {
                    for squares.iter().map(|square| html!{
                        <td>{square}</td>
                    })
                }
            </tr>
        }
    };

    html! {
        <>
        <table>
            {
                for create_board(*is_flipped).iter().map(render_squares).rev()
            }
        </table>
        <button onclick={onclick}>{"Flip"}</button>
        </>
    }
}

fn main() {
    yew::Renderer::<App>::new().render();
}
