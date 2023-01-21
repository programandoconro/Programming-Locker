use chrono::{Datelike, NaiveDate};
use std::io;

fn is_leap_year(year: i32) -> bool {
    if year % 4 != 0 {
        return false;
    } else if year % 100 != 0 {
        return true;
    } else if year % 400 != 0 {
        return false;
    } else {
        return true;
    }
}

fn main() {
    let mut input_year = String::new();
    let mut input_month = String::new();

    println!("Enter year:");
    io::stdin()
        .read_line(&mut input_year)
        .expect("Failed to read");
    let year: i32 = input_year.trim().parse().expect("Please input a number");
    
    println!("Enter month:");
    io::stdin()
        .read_line(&mut input_month)
        .expect("Failed to read");
    let month: u32 = input_month.trim().parse().expect("Please input a number");
    let day: u32 = 1;

    let date = NaiveDate::from_ymd_opt(year, month, day);

    match date {
        None => println!("{}", "invalid date"),
        Some(valid_date) => {
            let number_of_days = match valid_date.month() {
                2 if is_leap_year(year) => 29,
                2 => 28,
                4 | 6 | 9 | 11 => 30,
                _ => 31,
            };
            println!("Number of days:{:?}", number_of_days);
            for i in 1..=number_of_days {
                print!(" {}", i);
            }
        }
    }
}
