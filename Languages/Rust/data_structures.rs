use std::collections::HashMap;

fn main() {
    println!("Data structures: \n");
    println!("Integers");
    {
        let signed: i8 = -10;
        let unsigned: u8 = 10;

        println!("Signed: {:?}\nUnsigned {:?}", signed, unsigned);
    }
    {
        let signed: i32 = -1000000000;
        let unsigned: u32 = 10;

        let long_pos_number: u128 = 100000000000000000000000000000000000000;  

        println!("Signed: {:?}\nUnsigned {:?}\nLong positive number {:?}", signed, unsigned, long_pos_number);

        let floating_point:f64 = 3.14;
        let floating_point_negative:f64 = -3.14845646546424212121214654654;
        let single_precision: f32 = 3.1454545465465465464;
        println!("Floating points: Positive: {floating_point} and Negative: {floating_point_negative}. Also there is f32, for single precision: {single_precision}");
    }

    println!("Tuples");
    {
        let tuple: (u8, u8, &str) = (1,2,"3");
        println!("Cannot loop over tuples, but can access values with indexing, like tuple.0 is {0}", tuple.0);
        println!("But can destructure tuples");

        let (x, _, _) = tuple;
        println!("x is {x}");
        
    }

    println!("Arrays"); {
        println!("Each element has to be of same type, size has to be fixed");

        let arr: [i8; 3] = [1,2,3];

        println!("Arrays have a lot of methods");
        println!("Can access by index, like arr[0] is {:?}", arr[0]);
    }

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
