import React from "react";
import EventTile from "./EventTile";

const DisplayEventTile = (props) => {

    return  (props.events.map((x) => <EventTile key={`${x.title}`} title={x.title} timePeriod={x.timePeriod} description={x.description}/>));

}

export default DisplayEventTile