import React, { useState, useEffect } from "react";
import { Link } from "react-router-dom";
import LauncherTile from "./LauncherTile";

const LauncherList = (props) => {
  const [launchers, setLaunchers] = useState([]);

  useEffect(() => {
    getLaunchers();
  }, []);

  const getLaunchers = async () => {
    const response = await fetch("/api/v1/launchers");
    let data = await response.json();
    //console.log(data)
    setLaunchers(data);
  };

  const launcherList = launchers.map((launcher) => {
    return (
      <li key={launcher.id}>
        {" "}
        <Link to={`/launchers/${launcher.id}`}>
          {launcher.name}
        </Link>
      </li>
    );
  });

  return (
    <div>
      <ul>{launcherList}</ul>
    </div>
  );
};

export default LauncherList;

{
  /* <Link to="/launchers/${id}">{launcher.name}</Link> */
}

// change your li's to instead be li's that you render in a LauncherTile
// nested a Link tag from react-router inside of your launcher lis
