import React, { useState } from "react";
import Restaurant from "./Restaurant";
import reviewData from "../constants/reviews";
import ReviewList from "./ReviewList";
import ReviewFrom from "./ReviewForm";

const App = (props) => {
  const [reviews, setReviews] = useState(reviewData);
  const [inputs, setInputs] = useState({
    name: "",
    rating: "",
    content: "",
    id: "",
  });

  const infoSubmitHandler = (information) => {
    setReviews(reviews.concat(information));
  };

  const handleSubmit = (event) => {
    event.preventDefault();
    infoSubmitHandler(inputs);
    setInputs({
      name: "",
      rating: "",
      content: "",
      id: "",
    });
  };

  return (
    <div className="grid-container">
      <div className="grid-x">
        <div className="restaurants cell small-3">
          <h3>Restaurants</h3>
          <Restaurant />
        </div>

        <div className="reviews cell auto grid-x">
          <div className="cell">
            <h3>Review Form</h3>

            <ReviewFrom
              inputs={inputs}
              setInputs={setInputs}
              handleSubmit={handleSubmit}
            />
          </div>

          <div className="cell">
            <h3>Reviews</h3>

            <ReviewList reviewData={reviews} />
          </div>
        </div>
      </div>
    </div>
  );
};

export default App;
