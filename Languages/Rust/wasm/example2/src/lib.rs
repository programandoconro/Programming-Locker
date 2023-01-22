use chrono::{Datelike, NaiveDate};
use wasm_bindgen::prelude::*;

pub fn is_leap_year(year: i32) -> bool {
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
#[wasm_bindgen]
pub fn get_month_days() -> i32 {
    let year: i32 = 2023;

    let month: u32 = 2;
    let day: u32 = 1;

    let date = NaiveDate::from_ymd_opt(year, month, day);

    match date {
        None => -1,
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
            number_of_days
        }
    }
}
