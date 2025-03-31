process.stdin.resume();
process.stdin.setEncoding('ascii');


console.log(`What is your name?`)

process.stdin.on('data', function(name){
  console.log(`Hello dear ${name}`)
  process.exit(0);

})




