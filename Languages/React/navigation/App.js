import React from "react"
import { Route, Switch,Link } from "react-router-dom"

const Homepage = () => {
    return (
      <div>
        <p>Welcome to my website about my pets.</p>
        <ul>
          <li>
            <Link to="/dog">My Dog</Link>
          </li>
          <li>
            <Link to="/cat">My Cat</Link>
          </li>
        </ul>
      </div>
    )
  }
  
  const Dog = (props) => {
    return (
      <div>
        <p>
          My dog Thundric is great. I couldn’t decide between Thunder or Electric. Don’t call him Rick.
        </p>
        <p>
          <button onClick={() => props.history.goBack()}>
          Back
          </button>
        </p>
      </div>
    )
  }
  
const Cat = (cosa) => {
  return (
    <div>
     <p> "I love my cat Smalls. He sure is hefty."</p>
     <p>
        <button onClick={() => cosa.history.goBack()}> 
          Back
        </button>
        <button onClick={() => cosa.history.push("/")}>
          Home
        </button>
     </p>
     </div>
)
}

const NotFound = () =>{ 
return "404 this page does not exist"
}

const App = () => {
  return (
    <div>
    <Switch>
      <Route exact path="/" component={Homepage} />
      <Route path="/dog" component={Dog} />
      <Route path="/cat" component={Cat} />
      <Route component={NotFound} />
      </Switch>
    </div>
  )
}

export default App
