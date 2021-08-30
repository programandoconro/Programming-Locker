import express from "express";

var response = {};
const App: express.Express = express();
App.use(express.json());

App.post("/", (req, res) => {
  console.log(req.body.name);
  response = { name: req.body.name };
  res.send("POST REQUESTED");
});

App.get("/", (_, res: express.Response) => {
  res.send(response);
});

App.listen(8080, () => {
  console.log("Active in https://localhost:8080");
});

//curl -X POST http://localhost:8080/ -H "Accept: application/json" -H "Content-type: application/json" -d '{ "name" : "ro" }'
