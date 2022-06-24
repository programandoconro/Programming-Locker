use std::process::Command;

// Runs a system command
fn main() {
    Command::new("ls")
        .arg("-l")
        .arg("-a")
        .spawn()
        .expect("ls command failed to start");
}
