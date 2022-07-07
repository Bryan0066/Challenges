import React, { useState } from "react";
import Message from "./message";
import Destination from "./Destination";

const WanderlustWishlist = (props) => {
  const places = props.data.places;
  const [destinationSelected, setDestinationSelected] = useState(places.id);

  let destinationListItems = places.map((placeObject) => {
    const destinationClick = () => {
      setDestinationSelected(placeObject.id);
    };
    let className = "body";
    if (placeObject.id === destinationSelected) {
      className = "done";
    }
    return (
      <Destination
        name={placeObject.name}
        id={placeObject.id}
        className={className}
        onClick={destinationClick}
      />
    );
  });

  let something = null;
  if (destinationSelected === props.data.favoritePlaceId) {
    something = <Message className="body" />;
  }

  return (
    <div id="wishlist-div">
      <div className="grid-container">
        <div className="small-12 text-center">
          <h3>Wanderlust Wishlist</h3>
          <ul>{destinationListItems}</ul>
        </div>
        <h1>{something}</h1>
      </div>
    </div>
  );
};

export default WanderlustWishlist;
