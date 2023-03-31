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
