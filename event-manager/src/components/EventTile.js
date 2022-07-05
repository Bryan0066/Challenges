import React from "react";

const EventTile = (props) => {
  let eventClass;

  if (props.eventType == "business") {
    eventClass = "blue-bg";
  }
  if (props.eventType == "personal") {
    eventClass = "green-bg";
  }
  if (props.eventType == "business-casual") eventClass = "pink-bg";
  else {
    eventClass == "event-tile";
  }

  return (
    <div class={eventClass}>
      <p>{props.title}</p>
      <p>{props.timePeriod}</p>
      <p>{props.description}</p>
    </div>
  );
};

export default EventTile;
