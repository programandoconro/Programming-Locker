use std::process::Command;
fn main() {
    Command::new("cmd")
        .args(&["/C", "echo", "Hello world Windows with Rust!"])
        .spawn()
        .expect("cmd command failed to start");
}

// Compile with rustc .\src\main.rs
// Execute with .\main.exe
