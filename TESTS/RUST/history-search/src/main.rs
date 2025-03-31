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

        {
        println!("You can also declare with repeated values");
        let arr = [5; 10]; // 10 times repeating the number 5
        for val in arr {
            println!("{val}");
        }

        }
        
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

    {
        println!("Functions");

        let t = {
            let x = 1;
            x + 1
        };
        println!("You can use curly braces to have a scope for calculation when declaring a variable, t is {t}");

        fn sum (x:i32, y:i32) -> i32 {
            x + y
        }
        println!("2 + 2 is: {}",sum(2, 2));
    }

    {
        let name = "Maria";
        let hello = "Hola ";
        let salute = [hello, " ", name].concat();
        let bye = "Bye ";
        let good_bye: String = String::new() + bye + name; 

        println!("{}", salute);
        println!("{}", good_bye);


    }
}