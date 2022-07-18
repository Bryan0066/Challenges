import React, { useDebugValue, useState } from "react";

const QuestionsForm = (props) => {
  const [currentQuestion, setCurrentQuestion] = useState({
    question: "",
    answer: "",
  });

  const handleSubmit = (event) => {
    event.preventDefault();
    let formPayload = {
      ...currentQuestion,
      [event.currentTarget.name]: event.currentTarget.value,
    };
    props.addQuestion(formPayload);
  };

  const handleChange = (event) => {
    setCurrentQuestion({
      ...currentQuestion,
      [event.currentTarget.name]: event.currentTarget.value,
    });

    console.log(currentQuestion)
  };

  return (
    <form onSubmit={handleSubmit}>
      <input
        type="text"
        value={currentQuestion.question}
        name="question"
        onChange={handleChange}
      />
      <input
        type="text"
        value={currentQuestion.answer}
        name="answer"
        onChange={handleChange}
      />
      <button className="button" type="submit">Submit</button>
    </form>
  );
};

export default QuestionsForm;
