import React from "react";
import Grocery from "./grocery";

const GroceryList = (props) => {
  // we will eventually be using .map over props.groceries
  // in the callback function of .map
  // return (create)
  // a new Grocery component with the grocery object we are iterating over
  const items = props.groceries.map((item) => {

    return <Grocery name={item.name}/>;
  });
  return( <ul className="container">{items}</ul>);
};

export default GroceryList;
