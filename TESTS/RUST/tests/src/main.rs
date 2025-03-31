use std::collections::HashMap;

#[derive(Debug)]
struct Result {
    option_a: String,
    option_b: String
}
fn main() {
    println!("Hello, world!");
    println!("{:?}",  return_wrong_object());
    let result = return_wrong_object();
    println!("{}",result.option_a);
    println!("{}",result.option_b);
}
fn return_wrong_object()->Result {
    let mut result= HashMap::new();

    result.insert(String::from("option_a"), String::from("test"));

   // result
    //mismatched types, expected struct `Result` found struct `HashMap<String, String>`

    let real_result = Result {option_a: String::from("ok"), option_b: String::from("b")};

    real_result


}
