import React, { useState, useEffect } from "react";

import ArticleShow from "./ArticleShow";

const ArticleShowContainer = (props) => {
  const [article, setArticle] = useState({});

  useEffect(() => {
    getArticle();
  }, []);

  //edited
  const getArticle = async () => {
    try {
      const response = await fetch(`/api/v1/articles/${props.match.params.id}`);
      if (!response.ok) {
        const errorMessage = `${response.status} ${response.statusText}`;
        const error = new Error(errorMessage);
        throw error;
      }
      const data = await response.json();
      setArticle(data);
    } catch (error) {
      console.log("error in fetch:", error);
    }
  };

  return (
    <ArticleShow id={article.id} title={article.title} body={article.body} />
  );
};

export default ArticleShowContainer;
