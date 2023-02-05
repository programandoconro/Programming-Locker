use wasm_bindgen::{JsCast, UnwrapThrowExt};
use web_sys::HtmlInputElement;
use yew::prelude::*;

#[function_component]
fn App() -> Html {
    let name = use_state(|| String::new());
    let oninput = Callback::from({
        let name = name.clone();
        move |input_event: InputEvent| {
            let target: HtmlInputElement = input_event
                .target()
                .unwrap_throw()
                .dyn_into()
                .unwrap_throw();
            web_sys::console::log_1(&target.value().into()); // <- can console the value.
            name.set(target.value());
        }
    });

    html! {
        <div>
            <input {oninput}  />
            <p>{"name: "} <span>{&*name}</span> </p>
        </div>
    }
}

fn main() {
    yew::Renderer::<App>::new().render();
}
