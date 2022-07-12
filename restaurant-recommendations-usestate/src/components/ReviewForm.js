import React from "react";

const ReviewForm = (props) => {
  const handleInputChange = (event) => {
    props.setInputs({
      ...props.inputs,
      [event.currentTarget.name]: event.currentTarget.value,
    });
  };

  return (
    <form onSubmit={props.handleSubmit}>
      <div>
        <label htmlFor="name"> Name:</label>
        <input
          type="text"
          id="name"
          name="name"
          onChange={handleInputChange}
          value={props.inputs.name}
        />
      </div>

      <div>
        <label htmlFor="rating">Rating (Write your rating from 1-100): </label>
        <input
          type="text"
          id="rating"
          name="rating"
          onChange={handleInputChange}
          value={props.inputs.rating}
        />
      </div>

      <div>
        <label htmlFor="content"> Comments:</label>
        <input
          type="text"
          id="content"
          name="content"
          onChange={handleInputChange}
          value={props.inputs.content}
        />
      </div>

      <input type="submit" className="button" value="Submit" />
    </form>
  );
};
export default ReviewForm;
