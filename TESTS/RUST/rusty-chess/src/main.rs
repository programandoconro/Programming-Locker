use wasm_bindgen::{prelude::Closure, JsCast};
use yew::prelude::*;
mod board;
mod piece;
use piece::Piece;
use web_sys::{window, HtmlElement, MouseEvent};
use yew::{html, Callback};

#[function_component]
fn App() -> Html {
    let is_flipped: UseStateHandle<bool> = use_state(|| false);
    let table_ref = use_node_ref();
    let width = use_state(|| 1);
    let height = use_state(|| 1);
    let onclick: Callback<MouseEvent> = {
        let is_flipped: UseStateHandle<bool> = is_flipped.clone();
        Callback::from(move |_| match *is_flipped {
            true => is_flipped.set(false),
            false => is_flipped.set(true),
        })
    };

    {
        let table_ref = table_ref.clone();
        let width = width.clone();
        let height = height.clone();
        use_effect_with_deps(
            |table_ref| {
                let table = table_ref
                    .cast::<HtmlElement>()
                    .expect("div_ref not attached to div element");
                {
                    let table = table_ref
                        .cast::<HtmlElement>()
                        .expect("div_ref not attached to div element");

                    width.set(table.client_width());
                    height.set(table.client_height());
                }
                let listener = Closure::<dyn Fn(Event)>::wrap(Box::new(move |_| {
                    let x = table.client_width();
                    let y = table.client_height();
                    //web_sys::console::log_1(&"update".to_string().into());
                    width.set(x);
                    height.set(y);
                }));
                let window = window().unwrap();
                window
                    .add_event_listener_with_callback("resize", listener.as_ref().unchecked_ref())
                    .ok();

                move || {
                    window
                        .remove_event_listener_with_callback(
                            "resize",
                            listener.as_ref().unchecked_ref(),
                        )
                        .ok();
                }
            },
            table_ref,
        );
    };

    let set_pawn = |square: &String| -> Html {
        if square == "e8" {
            html! {
               <Piece width={*width} height={*height} src={"img/king-black.png".to_string()} />
            }
        } else if square == "e1" {
            html! {
               <Piece width={*width} height={*height} src={"img/king-white.png".to_string()} />
            }
        } else if square == "d8" {
            html! {
               <Piece width={*width} height={*height} src={"img/queen-black.png".to_string()} />
            }
        } else if square == "d1" {
            html! {
               <Piece width={*width} height={*height} src={"img/queen-white.png".to_string()} />
            }
        } else if square == "a8" || square == "h8" {
            html! {
               <Piece width={*width} height={*height} src={"img/rook-black.png".to_string()} />
            }
        } else if square == "a1" || square == "h1" {
            html! {
               <Piece width={*width} height={*height} src={"img/rook-white.png".to_string()} />
            }
        } else if square == "f8" || square == "c8" {
            html! {
               <Piece width={*width} height={*height} src={"img/bishop-black.png".to_string()} />
            }
        } else if square == "f1" || square == "c1" {
            html! {
               <Piece width={*width} height={*height} src={"img/bishop-white.png".to_string()} />
            }
        } else if square == "g8" || square == "b8" {
            html! {
               <Piece width={*width} height={*height} src={"img/knight-black.png".to_string()} />
            }
        } else if square == "g1" || square == "b1" {
            html! {
               <Piece width={*width} height={*height} src={"img/knight-white.png".to_string()} />
            }
        } else if square.ends_with("7") {
            html! {
               <Piece width={*width} height={*height} src={"img/pawn-black.png".to_string()} />
            }
        } else if square.ends_with("2") {
            html! {
               <Piece width={*width} height={*height} src={"img/pawn-white.png".to_string()} />
            }
        } else {
            html! {<></>}
        }
    };

    let render_squares = |squares: &Vec<String>| -> Html {
        html! {
            <tr>
                {
                    for squares.iter().map(|square|
                    html!{
                        <td >{set_pawn(square)}</td>
                    })
                }
            </tr>
        }
    };

    html! {
        <div>

            <table ref={table_ref}>
                <tbody>
                    {
                    for board::create_board(*is_flipped).iter().map(render_squares).rev()
                    }
                </tbody>
            </table>
                <button onclick={onclick}>{"Flip"}</button>
        </div>
    }
}

fn main() {
    yew::Renderer::<App>::new().render();
}
