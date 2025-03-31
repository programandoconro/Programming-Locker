use super::utils::{command_output, confirm, execute};
extern crate skim;
use colored::Colorize;
use skim::prelude::*;
use std::io::Cursor;
use std::io::Write;

///
/// It switches to a different branch interactively using fzf. You can search best match, move the
/// cursor or just hit enter to select the target branch.
/// # Examples
/// rusty-git-commands --command switch
///
pub fn switch() {
    let options = SkimOptionsBuilder::default()
        .height(Some("50%"))
        .multi(true)
        .build()
        .unwrap();

    let branches = command_output("git", vec!["branch", "-a"]);

    let item_reader = SkimItemReader::default();
    let items = item_reader.of_bufread(Cursor::new(branches));

    let selected_items = Skim::run_with(&options, Some(items))
        .map(|out| out.selected_items)
        .unwrap_or_else(|| Vec::new());

    for item in selected_items.iter() {
        print!("{}{}", item.output(), "\n");
        let command = "git checkout".to_string() + &item.output();
        println!("{}", command);
        if confirm().is_ok() {
            execute(&command).expect("There was an error executing git command");
        }
    }
}

///
/// It creates a new git branch parsing and cleaning input. You can add multiples lines, incorrect
///  and non ASCII characters, and it will concatenate the name  using "-" as separator.
/// # Examples
/// rusty-git-commands --command create
///
pub fn create() {
    let input = read_user_input();
    let concatenated_input = sanitize(concatenate(input));
    let command = prepend_gitcheckout(concatenated_input);
    println!("{}", command.green());

    if confirm().is_ok() {
        execute(&command).expect(&"There was an error executing git command".red());
    }
}

fn prepend_gitcheckout(branch_name: String) -> String {
    "git checkout -b ".to_string() + &branch_name
}

fn prepend_tag_to_branch_name(tag: String, branch_name: String) -> String {
    tag + "-" + &branch_name
}

fn ask_for_tag(branch: String) -> String {
    loop {
        print!("{}", "Do you want to prepend a tag? (y/n): ".blue().bold());
        std::io::stdout().flush().unwrap();

        let mut input = String::new();
        std::io::stdin().read_line(&mut input).unwrap();
        let input = input.trim().to_lowercase();

        match input.as_str() {
            "y" | "yes" => {
                println!(
                    "{}",
                    "Please write the tag you want to prepend".blue().bold()
                );
                let mut tag = String::new();
                std::io::stdin().read_line(&mut tag).unwrap();
                return prepend_tag_to_branch_name(tag, branch);
            }
            "n" | "no" => {
                println!("{}", "No tag was added".green());
                return branch;
            }
            _ => {
                println!("{}", "Invalid input, please enter 'y' or 'n'.".red());
                return branch;
            }
        }
    }
}

fn read_user_input() -> Vec<String> {
    println!(
        "{}",
        "Enter branch name, then press Enter and Ctrl-D to end:"
            .blue()
            .bold()
    );

    std::io::stdin()
        .lines()
        .map(|e| e.unwrap_or("".to_string()))
        .collect()
}

fn concatenate(input: Vec<String>) -> String {
    let mut concatenated: String = "".to_string();
    for line in input {
        if concatenated.len() == 0 {
            concatenated = line;
        } else {
            let new_line = str::replace(&line, " ", "-");
            concatenated = concatenated + &"-".to_string() + &new_line;
        }
    }
    ask_for_tag(concatenated)
}

fn sanitize(haystack: String) -> String {
    let mut name = String::new();
    for ch in haystack.chars() {
        if ch.is_alphanumeric() && ch.is_ascii() {
            name.push(ch);
        } else {
            let last_char = name.chars().last().unwrap_or('-');
            if last_char != '-' {
                name.push('-')
            }
        }
    }
    let sanitized_branch_name = remove_last_hyphen(limit_name_len(name));

    sanitized_branch_name
}

fn limit_name_len(name: String) -> String {
    if name.len() < 100 {
        name
    } else {
        name[0..99].to_string()
    }
}

fn remove_last_hyphen(mut name: String) -> String {
    if name.ends_with('-') {
        name.pop();
        name
    } else {
        name
    }
}
#[test]
fn it_prepends_tag() {
    assert_eq!(
        prepend_tag_to_branch_name("TAG".to_string(), "branch-name".to_string()),
        "TAG-branch-name"
    );
}

#[test]
fn it_removes_hyphen() {
    let name_with_hyphen = "my-name-with-hyphen-in-the-end-".to_string();
    assert_eq!(
        remove_last_hyphen(name_with_hyphen),
        "my-name-with-hyphen-in-the-end"
    );
}

#[test]
fn it_limits_name_len() {
    let long_name = "very long name".repeat(100);
    assert!(long_name.len() >= 100);
    assert!(limit_name_len(long_name).len() < 100);
}

#[test]
fn it_handles_line_breaks() {
    let input = vec!["hola".to_string(), "chao".to_string()];
    let concatenated = concatenate(input);
    assert_eq!(concatenated, "hola-chao".to_string());
}

#[test]
fn it_sanitizes_forbidden_chars() {
    let input = "hola!@#$%^&*()+=?><コンに感chao";
    let cleaned = sanitize(input.to_string());
    assert_eq!(cleaned, "hola-chao".to_string());
}

#[test]
fn it_returns_checkout_command() {
    let command = prepend_gitcheckout("my-new-branch".to_string());
    assert_eq!(command, "git checkout -b my-new-branch".to_string());
}
