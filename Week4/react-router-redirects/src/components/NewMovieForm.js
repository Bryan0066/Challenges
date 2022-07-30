import React, { useState } from "react"
import { Redirect } from 'react-router-dom'

const NewMovieForm = props => {
  const [shouldRedirect, setShouldRedirect] = useState(false)
  const [movieTitle, setMovieTitle] = useState(false)

  const onTitleChange = event => {
    setMovieTitle(event.target.value)
  }

  const postNewMovie = async (event) => {
    event.preventDefault()

    try {
      const response = await fetch('/api/v1/movies', {
        method: "POST",
        credentials: "same-origin",
        headers: {
          "Content-Type": "application/json"
        },
        body: JSON.stringify({ title: movieTitle })
      })
      if (!response.ok) {
        const errorMessage = `${response.status} (${response.statusText})`
        const error = new Error(errorMessage)
        throw(error)
      }
      console.log("Movie was added successfully!")
      setShouldRedirect(true) // this is new!
    } 
    catch(err) {
      console.error(`Error in fetch: ${err.message}`)
    }
  }

  if (shouldRedirect) {
    return <Redirect push to="/movies" />
  }

  return (
    <form onSubmit={postNewMovie}>
      <label> New Movie
        <input
          type="text"
          name="title"
          onChange={onTitleChange}
          value={movieTitle}
        />
      </label>
      <input type="submit" />
    </form>
  )
}

export default NewMovieForm