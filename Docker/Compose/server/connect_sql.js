var mysql = require('mysql');

var con = mysql.createConnection({
  host: "172.19.0.2",
  user: "root",
  password: "example123",
  database: "mydata"
});

con.connect(function(err) {
  if (err) throw err;
  console.log("Connected!");
  con.query("SELECT * FROM testdb", function (err, result, fields) {
    if (err) throw err;
    console.log(result);
  });
  con.end();
});

// #!bash: node connect_sql.js > data

