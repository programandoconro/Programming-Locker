fn matrix2d() {
    let mut matrix: Vec<Vec<i32>> = Vec::new(); // or vec![]

    for i in 1..=64 {
        // remainder will be 1 the first and every 8 iterations (1 % 8, 9 % 8, 17 % 8 ...)
        if i % 8 == 1 {
            matrix.push(Vec::new());
        }
        let len: usize = matrix.len();
        matrix[len - 1].push(i);
    }

    println!("{:?}", matrix);

    // [[1, 2, 3, 4, 5, 6, 7, 8],
    // [9, 10, 11, 12, 13, 14, 15, 16], 
    // [17, 18, 19, 20, 21, 22, 23, 24],
    // [25, 26, 27, 28, 29, 30, 31, 32], 
    // [33, 34, 35, 36, 37, 38, 39, 40], 
    // [41, 42, 43, 44, 45, 46, 47, 48], 
    // [49, 50, 51, 52, 53, 54, 55, 56], 
    // [57, 58, 59, 60, 61, 62, 63, 64]]
}
