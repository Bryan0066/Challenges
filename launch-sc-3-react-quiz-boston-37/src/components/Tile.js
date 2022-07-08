import React from "react";

const Tile = (props) => {


  return (<p><button onClick={props.clickTile} className={props.className}>{props.body}</button></p>)
};

export default Tile;