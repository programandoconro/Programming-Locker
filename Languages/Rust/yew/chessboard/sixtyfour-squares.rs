use yew::prelude::*;

#[function_component]
fn App() -> Html {
    let mut matrix: Vec<Vec<i32>> = Vec::new(); // or vec![]

    for i in (1..=64).rev() {
        if i % 8 == 0 {
            matrix.push(Vec::new());
        }
        let len: usize = matrix.len();
        matrix[len - 1].push(i);
    }
    let rows = |row: &Vec<i32>| -> Html {
        html! {
            <tr>
                {
                    for row.iter().map(|x| html!{<td>{x}</td>}).rev()
                }
            </tr>
        }
    };

    html! {
        <table>
            {
                for matrix.iter().map(rows)
            }
        </table>
    }
}

fn main() {
    yew::Renderer::<App>::new().render();
}
