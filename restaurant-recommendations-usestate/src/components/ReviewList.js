import React from "react";

import Review from "./Review";

const ReviewList = ({ reviewData }) => {
  const allReviewData = reviewData.map((data) => {
    return (
      <Review
        key={data.id}
        id={data.id}
        name={data.name}
        restaurant_id={data.restaurant_id}
        rating={data.rating}
        content={data.content}
      />
    );
  });

  return <div>{allReviewData}</div>;
};

export default ReviewList;
