import React, { useState } from "react";

const FormContainer = (props) => {
  const [currentQuestion, setCurrentQuestion] = useState({
    question: "",
    answer: "who knows",
  });

  console.log(currentQuestion);

  const handleSubmit = (event) => {
    event.preventDefault();
    let formPayload = {
      question: currentQuestion.question,
      answer: currentQuestion.answer,
      id: 5,
    };
    props.addQuestion(formPayload);

    setCurrentQuestion("");
  };

  //   this isnt yet done because this doesnt work for the answer field
  const handleChange = (event) => {
    setCurrentQuestion({
      ...currentQuestion,
      [event.currentTarget.name]: event.currentTarget.value
    });
  };

  return (
    <form onSubmit={handleSubmit}>
      <input
        type="text"
        value={currentQuestion.question}
        name="question"
        onChange={handleChange}
      ></input>
      <input
        type="text"
        value={currentQuestion.answer}
        name="answer"
        onChange={handleChange}
      ></input>
      <input className="button" type="submit" value="Submit" />
    </form>
  );
};

export default FormContainer;
