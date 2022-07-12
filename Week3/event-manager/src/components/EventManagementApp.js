import React from "react";
import DisplayEventTile from "./DisplayEventTile";

const EventManagementApp = (props) => {
  const events = [
    {
      title: "Brunch with Werewolves",
      timePeriod: "10:00am - 12:00pm",
      description: null,
      eventType: "personal",
    },
    {
      title: "Strategy Meeting with the Finfolk on New Import Tariffs",
      timePeriod: "1:00pm - 2:00pm",
      description: "The World Wizardry Workgroup hit us hard on these tariffs.",
      eventType: "business",
    },
    {
      title: "Award Ceremony for Amrita the Banshee",
      timePeriod: "2:00pm - 3:00pm",
      description: "Bring earplugs, have fun.",
      eventType: "business-casual",
    },
    {
      title: "Djinn Tech Support with the Qamar and Caliope",
      timePeriod: "4:00pm - 5:00pm",
      description: "Computers are down, let them work their magic.",
      eventType: "business",
    },
  ];
  return (
    <div className="event-management-app">
      <h1>Now viewing your upcoming events</h1>
      <DisplayEventTile events = {events} />
      <div>
        <img
          className="fit-picture"
          src="https://horizon-production.s3.amazonaws.com/images/challenge/event-manager/event-manager-dogs.jpg"
        />
        <p> "The day may be ruff, but we are here for you in spirit!"</p>
      </div>
    </div>
  );
};

export default EventManagementApp;
