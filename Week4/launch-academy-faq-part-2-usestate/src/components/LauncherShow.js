import React, { useState, useEffect } from "react";


const LauncherShow = (props) => {
  const [launcher, setLauncher] = useState({});
  
  useEffect(() => {
    getLauncher();
  }, []);

  const getLauncher = async () => {
    const response = await fetch(`/api/v1/launchers/${props.match.params.id}`);
    let data = await response.json();
    setLauncher(data);
  };

  return (
    <div>
      <h1>{launcher.name}</h1>
      <p>{launcher.bio}</p>
    </div>
  );
};

export default LauncherShow;

// delete LauncherInfo and just do all of the JSX in here
