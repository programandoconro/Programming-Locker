import { io } from "socket.io-client";
export class createSocket {
  socket = io("ws://localhost:8080/", {});
}
