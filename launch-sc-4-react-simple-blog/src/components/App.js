import React from "react"
import { Route, Switch, BrowserRouter, Router } from "react-router-dom"

import ArticleShowContainer from "./ArticleShowContainer"
import ArticlesIndexContainer from "./ArticlesIndexContainer"

const App = (props) => {
  return (
    <BrowserRouter>
      <Switch>
      <Route exact path="/" component={ArticlesIndexContainer}/>
      <Route exact path="/articles/:id" component={ArticleShowContainer}/>
      </Switch>
    </BrowserRouter>
  )
}

export default App
