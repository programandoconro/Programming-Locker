var mysql = require('mysql');

var con = mysql.createConnection({
  host: "172.30.0.2",
  user: "root",
  password: "example123"
});

con.connect(function(err) {
  if (err) throw err;
  console.log("Connected!");
});
