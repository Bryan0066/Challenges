import React,{useState, useEffect} from "react";
import LauncherInfo from "./LauncherTile";
import LauncherList from "./LauncherList";

const LauncherShow = (props) => {
    const [launcher, setLauncher] = useState({});
    console.log(launcher)

    useEffect(() => {getLauncher();}, []);

    // go into props, and find the id of the launcher (the number in the end of the url)
    // launcherId = some prop that is currently being passed to this component
    const getLauncher = async () => {

        // will need to rewrite this line to use string interpolation 
      const response = await fetch("/api/v1/launchers/2");
      let data = await response.json();

      setLauncher(data);
    };

    return (
        <div>
            <LauncherInfo launcher={launcher}/>
            <h1>yes</h1>
            <h1>{launcher.name}</h1>
        </div>
    )
}

export default LauncherShow

// delete LauncherInfo and just do all of the JSX in here