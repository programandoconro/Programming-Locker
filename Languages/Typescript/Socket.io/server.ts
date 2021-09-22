import express from "express";
import { Server } from "socket.io";
import http from "http";

const App: express.Express = express();
const httpServer = new http.Server(App);
const io = new Server(httpServer);

let nu: number = 0;
App.get("/", (_, res) => {
  res.json({ ping: nu });
});
io.on("connect", (socket) => {
  console.log(`connect ${socket.id}`);

  socket.on("ping", () => {
    console.log(nu);
    nu = nu + 1;
  });

  socket.on("disconnect", () => {
    console.log(`disconnect ${socket.id}`);
  });
});
httpServer.listen(3000, () => {
  console.log("connected");
});
