import { useEffect, useState } from "react";
import "./App.css";
import { generateToken } from "./token";
import { createSocket } from "./socket";

const user = generateToken(5);
function App() {
  const socket = new createSocket();
  const [inMessage, setInMessage] = useState<string[]>([""]);
  const [outMessage, setOutMessage] = useState<string>("");

  useEffect(() => {
    function getSocketMessage() {
      socket.socket.on("message", (data) => {
        data &&
          setInMessage((msg) => [...msg, `${data.user} says: ${data.message}`]);
      });
    }
    function closeSocket() {
      socket.socket.disconnect();
      socket.socket.off();
    }

    getSocketMessage();
    return () => {
      closeSocket();
    };
    // eslint-disable-next-line
  }, []);

  const handleSendMessage = () => {
    outMessage.length > 0 &&
      socket.socket.emit("message", {
        user: user,
        message: outMessage,
      });
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
  const handleClear = () => {
    setInMessage([""]);
  };
  return (
    <div className="App">
      <header className="App-header">
        <h1>User: {user.substring(0, 5)}</h1>
        <br />
        <input
          className="Input-message"
          placeholder="Please write a mssg."
          value={outMessage}
          onChange={(e) => setOutMessage(e.target.value)}
        />
        <br />
        <button onClick={handleSendMessage}>send</button>
        <br />
        <h1>Chat:</h1>
        <div className="Messages">
          <ShowInMessages />
        </div>
        <br />
        <button onClick={handleClear}>clear</button>
      </header>
    </div>
  );
}

export default App;
