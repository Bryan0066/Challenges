import React from "react";
import PreformanceList from "./PreformanceList";

const Popup = (props) => {
  return (
    <div>
      <button type="button">X</button>
      <h1>You have won tickets to see Taylor Swift!</h1>
      <p>Please enter your email so we can send them to you!</p>

      <form>
        <input type="text" placeholder="Your email here" />

        <input type="submit" value="CLAIM YOUR PRIZE!!"></input>
      </form>

      <PreformanceList />
    </div>
  );
};

export default Popup;
