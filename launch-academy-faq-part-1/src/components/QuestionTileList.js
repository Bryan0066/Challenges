import React, { useState } from "react";

import QuestionTile from "./QuestionTile";

const QuestionTileList = (props) => {
  const [questionSelected, setQuestionSelected] = useState(null);

  const questionsList = props.data.map((questionObject) => {
    // let answerShow = false;

    // const selectObject = () => {
    //   if (!answerShow === true) {
    //     setQuestionSelected(questionObject.id);
    //     answerShow = true
    //   } else {
    //     setQuestionSelected(null)
    //   }
    // };

    const selectObject = () => {
      if (questionObject.id === questionSelected) {
        setQuestionSelected(null);
      } else {
        setQuestionSelected(questionObject.id);
      }
    };

    let answer = null;
    if (questionObject.id === questionSelected) {
      answer = questionObject.answer;
    }

    return (
      <QuestionTile
        id={questionObject.id}
        question={questionObject.question}
        answer={answer}
        selected={selectObject}
      />
    );
  });

  return (
    <div>
      <h1 className="center-text">We're here to help</h1>
      {questionsList}
    </div>
  );
};

export default QuestionTileList;
