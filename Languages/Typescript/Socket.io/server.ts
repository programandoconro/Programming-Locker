import express from "express";
import { Server } from "socket.io";
import http from "http";
import cors from "cors";
import helmet from "helmet";

const App: express.Express = express();
App.use(cors());
App.use(helmet());
const httpServer = new http.Server(App);
const io = new Server(httpServer, {
  cors: {
    origin: "*",
    methods: ["GET", "POST"],
  },
});
let messages: string[] = [""];
App.get("/", (_, res) => {
  res.json({ messages: messages });
});
io.on("connect", (socket) => {
  console.log(`connect ${socket.id}`);
  socket.on("message", (data) => {
    messages.push(`${data.user} says:  + ${data.message}`);
    socket.broadcast.emit("message", {
      user: data.user,
      message: data.message,
    });
  });
  socket.on("disconnect", () => {
    console.log(`disconnect ${socket.id}`);
  });
});
httpServer.listen(3000, () => {
  console.log("connected");
});
