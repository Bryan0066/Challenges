import React from "react";
import { Link } from "react-router-dom";

const LauncherTile = (props) => {
  return (
    <div>
      <Link to={`/launchers/${props.id}`}>{props.name}</Link>
    </div>
  );
};

export default LauncherTile;
