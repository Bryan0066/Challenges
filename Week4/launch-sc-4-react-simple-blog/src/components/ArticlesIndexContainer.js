import React, { useState, useEffect } from "react";

import ArticleTile from "./ArticleTile";
import ArticleFormContainer from "./ArticleFormContainer";

const ArticlesIndexContainer = (props) => {
  const [articles, setArticles] = useState([]);

  useEffect(() => {
    getArticles();
  }, []);

  // try()catch() here!
  const getArticles = async () => {
    try {
      const response = await fetch("/api/v1/articles");
      if (!response.ok) {
        const errorMessage = `${response.status} ${response.statusText}`;
        const error = new Error(errorMessage);
        throw error;
      }
      const data = await response.json();
      setArticles(data);
    } catch (error) {
      console.log("error in fetch:", error);
    }
  };

  // ESPECIALLY when working with POST fetch requests,
  // error handling with try/catch is super important to let us know when something goes wrong
  const addNewArticle = async (formPayload) => {

    try {
      
      const response = await fetch("/api/v1/articles", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(formPayload),
    });
      if (!response.ok) {
        const errorMessage = `${response.status} ${response.statusText}`
        const error = new Error(errorMessage)
        throw error
      }
      const body = await response.json();
    setArticles(articles.concat(body));
    } catch (error) {
      console.log("error in fetch:", error)
    }
  };

  const articleTiles = articles.map((article) => {
    return (
      <ArticleTile
        key={article.id}
        id={article.id}
        title={article.title}
        body={article.body}
      />
    );
  });

  return (
    <div className="grid-container">
      <div className="small-8">
        <h1>My Blog!</h1>

        <ArticleFormContainer addNewArticle={addNewArticle} />

        {articleTiles}
      </div>
    </div>
  );
};

export default ArticlesIndexContainer;
