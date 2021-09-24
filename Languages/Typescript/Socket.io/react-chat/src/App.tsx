import { useEffect, useState } from "react";
import "./App.css";
import { io } from "socket.io-client";

function App() {
  const socket = io("ws://localhost:3000/", {});
  const [user, setUser] = useState<string>("");
  const [inMessage, setInMessage] = useState<string[]>([""]);
  const [outMessage, setOutMessage] = useState<string>("");
  useEffect(() => {
    socket.on("connect", () => {
      setUser(socket.id);
      console.log(`connect ${socket.id}`);
    });
    socket.on("message", (data) => {
      data &&
        setInMessage((msg) => [...msg, data.user + " says: " + data.message]);
    });
  }, []);
  const handleSendMessage = () => {
    socket.emit("message", { user: user.substring(0,5), message: outMessage });
    setOutMessage("");
  };
  const ShowInMessages = () => {
    return (
      <div>
        {inMessage.map((msg, key) => {
          return (
            <div key={key}>
              <h5>{msg}</h5>
            </div>
          );
        })}
      </div>
    );
  };
  return (
    <div className="App">
      <header className="App-header">
        <h1>User: {user}</h1>
        <br />
        <input
          placeholder="Please write a mssg."
          value={outMessage}
          onChange={(e) => setOutMessage(e.target.value)}
        />
        <br />
        <button onClick={handleSendMessage}>send</button>
        <br />
        <h1>Chat messages:</h1>
        <div className="Messages">
          <ShowInMessages />
        </div>
      </header>
    </div>
  );
}

export default App;
