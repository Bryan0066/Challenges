import React from "react";

const EventTile = (props) => {
  let eventClass;

  if (props.eventType == "business") {
    eventClass = "blue-bg";
  }
  if (props.eventType == "personal") {
    eventClass = "green-bg";
  }
  if (props.eventType == "business-casual") {
    eventClass = "pink-bg";
  } else {
    eventClass == "event-tile";
  }

  const id = Math.random();

  return (
    <div id={id} className={eventClass}>
      <h2>{props.title}</h2>
      <p>{props.timePeriod}</p>
      <p>{props.description}</p>
      <button> Complete! </button>
    </div>
  );
};

export default EventTile;
