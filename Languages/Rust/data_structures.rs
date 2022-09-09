use std::{collections::HashMap, hash::Hash};

fn main() {
    println!("Data structures: \n");
    println!("Vectors: \n");
    {
        let mut my_integer_array: Vec<u32> = Vec::new();
        my_integer_array.push(20);
        my_integer_array.push(40);

        println!("{:?}", my_integer_array);
    }

    {
        let v_int: Vec<i32> = vec![1, 2, 3];
        println!("{:?}", v_int);
        println!("Index 0 is: {:?}", v_int.get(0));
        println!("Index 100 is: {:?}", v_int.get(100));
    }

    {
        let v_string: Vec<&str> = vec!["Hello", "World", "Rust"];
        for i in v_string {
            print!("{} ", i)
        }
        println!("\n")
    }

    {
        println!("Hashes: \n");

        let mut my_hash: HashMap<&str, u32> = HashMap::new();

        my_hash.insert("key_1", 0);
        my_hash.insert("key_2", 12);

        println!("{:?} ", my_hash);
    }
}
