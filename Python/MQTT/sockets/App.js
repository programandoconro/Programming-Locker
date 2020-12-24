import React, { useEffect,useState, Fragment } from 'react';
import './App.css';

import mqtt from 'mqtt';

var client  = mqtt.connect('ws://192.168.x.xxx:9001');

client.subscribe('mytopic/test/example');

function App() {

useEffect(()=>{

  client.on('message', function (topic, message) {
    const note = message.toString();
    // Updates React state with message 
    setMesg(note);
    console.log(note);

    });

},[])

  // Sets default React state 
  const [mesg, setMesg] = useState(<Fragment><em>nothing heard</em></Fragment>);

  return (
    <div className="App">
    <header className="App-header">
    <p>The message is: {mesg}</p>
        <p>
        </p>
        </header>
        </div>
  );
}

export default App;
