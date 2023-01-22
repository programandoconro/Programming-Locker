use std::os::raw::c_char;
use std::ffi::CString;
use wasm_bindgen::prelude::*;

#[wasm_bindgen]
pub fn greet() -> *const c_char {
    let message = CString::new("Hello, World!").expect("CString::new failed");
    message.as_ptr()
}
