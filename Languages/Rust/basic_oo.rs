#[derive(Default)]
struct Object {
    state: String
}

fn main() {
    let object: &mut Object = &mut Object::default();
    object.set_state("chao".to_string());
    println!("{}", object.get_state());
    
}

impl Object {
    fn get_state(&self) -> &str{
        &self.state
    }

    fn set_state(&mut self, new_state: String){
        self.state = new_state;
    }
}
