import express from "express";
import cors from "cors";
import helmet from "helmet";

const App: express.Express = express();
App.use(cors());
App.use(express.json());
App.use(helmet());

App.use((req, res, next) => {
  if (!req.headers.authorization) {
    return res.status(403).json({ error: "No credentials sent!" });
  }
  next();
});

App.use((req, res, next) => {
  const auth = { login: "yourlogin", password: "yourpassword" }; // change this
  const b64auth = (req.headers.authorization || "").split(" ")[1] || "";
  const strauth = Buffer.from(b64auth, "base64").toString();
  const splitIndex = strauth.indexOf(":");
  const login = strauth.substring(0, splitIndex);
  const password = strauth.substring(splitIndex + 1);

  if (login && password && login === auth.login && password === auth.password) {
    return next();
  }

  res.set("WWW-Authenticate", 'Basic realm="401"');
  res.status(401).send("Authentication required.");

});
App.post("/", (req, res) => {
  console.log(req.body.name);
  response = { name: req.body.name };
  res.send("POST REQUESTED");
});

var response: object = { name: "test" };

App.get("/", (_, res: express.Response) => {
  res.send(response);
});

App.listen(8080, () => {
  console.log("Active in https://localhost:8080");
});

//curl -X POST http://localhost:8080/ -H "Accept: application/json" -H "Content-type: application/json" -d '{ "name" : "rodo" }' -u "yourlogin:yourpassword"
