import React from "react";
import { BrowserRouter, Switch, Route } from "react-router-dom";

import CerealsIndex from "./CerealsIndex.js";
import CerealShow from "./CerealShow.js"

export const App = (props) => {
  return (
    <BrowserRouter>
      <Switch>
        <Route exact path={"/"} component={CerealsIndex} />
        <Route exact path={"/cereal"} component={CerealsIndex} />
        <Route exact path={"/cereal/:id"} component={CerealShow} />
      </Switch>
    </BrowserRouter>
  );
};
export default App;
