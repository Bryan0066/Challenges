import React, { useState } from "react";

const FormContainer = (props) => {
  const [currentQuestion, setCurrentQuestion] = useState({
    question: "",
    answer: "",
    id:"",
  });

  const handleSubmit = (event) => {
    event.preventDefault();
    let formPayload = {
      ...currentQuestion,
      [event.currentTarget.name]: event.currentTarget.value
    };
    props.addQuestion(formPayload);
  };

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
      <input className="button" type="submit" />
    </form>
  );
};

export default FormContainer;
