import React from "react";
import { Switch, Route, Link } from "react-router-dom";

import Goodbye from "./Goodbye";
import CustomGreeting from "./CustomGreeting";
import Greeting from "./Greeting";
import Form from "./Form";

const NavBar = (props) => {
  return (
    <div className="grid-x">
      <div className="cell">
        <button>
          <Link to="/Greeting">Greeting</Link>
        </button>
      </div>
      <div className="cell ">
        <button>
          <Link to="/customgreeting">CustomGreeting</Link>
        </button>
      </div>
      <div className="cell">
        <button>
          <Link to="/goodbye">Goodbye</Link>
        </button>
      </div>
      <div className="nav">
        <button>
          <Link to="/form">Form</Link>
        </button>
      </div>

      <Switch>
        <Route exact path="/goodbye" component={Goodbye} />
        <Route exact path="/customgreeting" component={CustomGreeting} />
        <Route exact path="/greeting" component={Greeting} />
        <Route exact path="/form" component={Form} />
      </Switch>

      <div className="footer">
        <p>I am the best footer... though, this site is ugly as hell bro</p>
      </div>
    </div>
  );
};

export default NavBar;

