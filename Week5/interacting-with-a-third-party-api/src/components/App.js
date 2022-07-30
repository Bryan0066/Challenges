import React from "react";
import { Route, BrowserRouter, Switch } from "react-router-dom";

import ForecastShow from "./forecastShow";

const App = (props) => {
  return (
      <BrowserRouter>
      <Switch>
      <Route exact path="/forecast" component={ForecastShow}/>
      </Switch>
      </BrowserRouter>
  );
};

export default App;
