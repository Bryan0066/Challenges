import React, { useState } from "react";
import { Redirect } from "react-router-dom";

const NewMovieForm = (props) => {
  const [movieTitle, setMovieTitle] = useState("");
  const [shouldRedirect, setShouldRedirect] = useState(false);

  const onTitleChange = (event) => {
    setMovieTitle(event.target.value);
  };

  const postNewMovie = async () => {
    event.preventDefault();

    try {
      const response = await fetch("/api/v1/movies", {
        method: "POST",
        credentials: "same-origin",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({ title: movieTitle }),
      });
      if (!response.ok) {
        const errorMessage = `${response.status} (${response.statusText})`;
        const error = new Error(errorMessage);
        throw error;
      }
      setShouldRedirect(true);
    } catch (err) {
      console.error(`Error in fetch: ${err.message}`);
    }
  };

  if (shouldRedirect) {
    return <Redirect to="/movies" />;
  }

  return (
    <form onSubmit={postNewMovie}>
      <label>
        Movie Title
        <input
          type="text"
          name="title"
          onChange={onTitleChange}
          value={movieTitle}
        />
      </label>
      <input type="submit" />
    </form>
  );
};

export default NewMovieForm;
