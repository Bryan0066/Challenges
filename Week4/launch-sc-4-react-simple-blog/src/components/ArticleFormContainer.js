import React, { useState, useEffect } from "react";

const ArticleFormContainer = (props) => {
  const [currentArticle, setCurrentArticle] = useState({
    // Edited 
    title: "",
    body: "",
  });

  // Edited
  const handleSubmit = (event) => {
    event.preventDefault();
    props.addNewArticle(currentArticle);
    currentArticle.title=""
    currentArticle.body=""
  };

  const handleChange = (event) => {
    setCurrentArticle({
      ...currentArticle,
      [event.currentTarget.name]: event.currentTarget.value,
    });
  };

  return (
    <form className="new-article-form callout" onSubmit={handleSubmit}>
      <label>
        Article Title:
        <input
          name="title"
          id="title"
          type="text"
          // Edited
          value={currentArticle.title}
          onChange={handleChange}
        />
      </label>
      <label>
        Article Body:
        <input
          name="body"
          id="body"
          type="text"
          // Edited 
          value={currentArticle.body}
          onChange={handleChange}
        />
      </label>

      <div className="button-group">
        <input className="button" type="submit" value="Submit" />
      </div>
    </form>
  );
};

export default ArticleFormContainer;
