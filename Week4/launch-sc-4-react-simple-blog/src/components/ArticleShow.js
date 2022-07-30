import React from "react"
import { Link } from "react-router-dom"

const ArticleShow = (props) => {
  // this is a presentational component, to be used with the ArticleShowContainer
  return (
    <div className="article-show" >
      <h2>{props.title}</h2>
      <p>{props.body}</p>
    </div>
  )
}

export default ArticleShow
