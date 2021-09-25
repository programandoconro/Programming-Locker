import express from "express";
import { Server } from "socket.io";
import http from "http";
import cors from "cors";
import helmet from "helmet";

// Configuration.
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
// Get messages API. 
let messages: string[] = [""];
App.get("/", (_, res) => {
  res.json({ messages: messages });
});
// Websockets.
io.on("connect", (socket) => {
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
// Listen.
httpServer.listen(8080, () => {
  console.log("connected");
});
