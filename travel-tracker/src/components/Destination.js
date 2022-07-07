import React from "react";

const Destination = (props) => {
  return (
    <p className={props.className} onClick={props.onClick}>
      {" "}
      {props.name}
    </p>
  );
};

export default Destination;
