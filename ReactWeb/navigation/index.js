import React from "react"
import ReactDOM from "react-dom"
import App from "./Routes"
import { Router } from "react-router-dom"
import createHistory from 'history/createBrowserHistory'

const history = createHistory()

ReactDOM.render(
  
  <Router history={history}>
    <App/>
  </Router>,
 
 document.getElementById("root")
)
