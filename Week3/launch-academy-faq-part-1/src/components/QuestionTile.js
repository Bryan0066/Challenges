import React from "react";

const QuestionTile = (props) => {
  return (
    <div className="questionTile">
      <button className="button" onClick={props.selected}>
        +
      </button>
      <h4>{props.question}</h4>
      <p id={props.id}>{props.answer}</p>
    </div>
  );
};

export default QuestionTile;
