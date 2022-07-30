import React, { useState } from "react";
import WanderlustWishlist from "./WanderlustWishlist";

const App = (props) => {
  return <WanderlustWishlist
          data={props.data}
          />;
};

export default App;
