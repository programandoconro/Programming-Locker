let fibo = [0,1,1];

for (i=2;i<10;i++){
    fibo.push((fibo[i - 1]) + (fibo[i - 2]));
    console.log(fibo);
}
