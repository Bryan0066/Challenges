import React, { useState, useEffect } from "react";
import LauncherTile from "./LauncherTile";

const LauncherList = (props) => {
  const [launchers, setLaunchers] = useState([]);

  useEffect(() => {
    getLaunchers();
  }, []);

  const getLaunchers = async () => {
    const response = await fetch("/api/v1/launchers");
    const data = await response.json();
    setLaunchers(data);
  };
  debugger

  const launcherComponentTiles = launchers.map((launcher) => {
      
    return (
          <LauncherTile>
            name={launcher.name}
            id={launcher.id}
            key={launcher.id}
            bio={launcher.bio}
          </LauncherTile>
    );
  });

  return (
    <div>
      <h1>Hello</h1>
      {launcherComponentTiles}
    </div>
  );
};

export default LauncherList;
