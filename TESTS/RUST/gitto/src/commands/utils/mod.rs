use colored::Colorize;
use std::io::{self, BufRead, Error};
use std::process::Command;

pub fn command_output(command: &str, args: Vec<&str>) -> String {
    let output = Command::new(command)
        .args(&args)
        .output()
        .expect(&"Failed to execute command".red());

    let stdout = String::from_utf8(output.stdout).expect("Invalid UTF-8");

    let mut result = String::new();
    for branch in stdout.lines() {
        result = result + "\n" + branch;
    }

    result
}

pub fn check_path_is_repository() {
    match execute("git rev-parse --is-inside-work-tree") {
        Ok(_) => (),
        Err(_) => {
            eprintln!("Path is not a git repository. Finished");
            panic!("checking if path is a git repository");
        }
    }
}

pub fn execute(command: &str) -> Result<i32, i32> {
    let output = Command::new("sh")
        .arg("-c")
        .arg(command)
        .output()
        .expect(&"failed to execute command".red());

    if output.status.success() {
        let stdout = String::from_utf8_lossy(&output.stdout);
        println!("{}", stdout);
        Ok(0)
    } else {
        Err(1)
    }
}

pub fn confirm() -> Result<bool, Error> {
    let mut input = String::new();
    let stdin = io::stdin();

    ctrlc::set_handler(move || {
        println!("{}", "Bye...".red());
        std::process::exit(1);
    })
    .expect("Error setting Ctrl-C handler");

    println!(
        "{}",
        "Press ENTER to confirm or Ctrl-C to cancel".blue().bold()
    );

    match stdin.lock().read_line(&mut input) {
        Ok(_) => Ok(true),
        Err(e) => Err(e),
    }
}

#[test]
fn it_executes_shell_commands() {
    let result = execute("echo hola");
    assert_eq!(result.unwrap(), 0);
}
