use yew::prelude::*;

#[function_component]
fn App() -> Html {
    let mut board: Vec<Vec<String>> = Vec::new();
    let columns: Vec<char> = vec!['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h'];
    let rows: Vec<char> = vec!['1', '2', '3', '4', '5', '6', '7', '8'];
    
     for column in columns {
        board.push(Vec::new());
        for row in &rows {
            let mut square = String::new();
            square.push(column);
            square.push(*row);
            let len: usize = board.len();
            board[len - 1].push(square);
            //web_sys::console::log_1(&square.into());
        }
    }
      
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
        <table>
            {
                for board.iter().map(render_squares).rev()
            }
        </table>
    }
}

fn main() {
    yew::Renderer::<App>::new().render();
}
