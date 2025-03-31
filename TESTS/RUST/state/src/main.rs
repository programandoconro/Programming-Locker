#[derive(Default)]
struct Object {
    state: String,
}
fn main() {
    let object: &mut Object = &mut Object::default();
    object.setter("chao".to_string());
    println!("{}", object.getter());

    let (counter, mut set_counter) = use_state(0);
    println!("{:?}", counter()); // 0

    set_counter(1);
    println!("{:?}", counter()); // 1
}

impl Object {
    fn getter(&self) -> &str {
        &self.state
    }

    fn setter(&mut self, new_state: String) {
        self.state = new_state;
    }
}
use std::rc::Rc;
use std::cell::Cell;

fn use_state<T: Copy>(value: T) -> (impl Fn() -> T, impl FnMut(T)) {
    let val = Rc::new(Cell::new(value));

    let state = {
        let val = Rc::clone(&val);
        move || -> T { val.get() }
    };

    let set_state = move |v: T| {
        val.set(v);
    };
    (state, set_state)
}
