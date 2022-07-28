import React, { useState, useEffect } from 'react';
import PostTile from './PostTile';
import FormContainer from './FormContainer';

const FloofFeed = (props) => {
  const [floof, setFloof] = useState({})
  const [posts, setPosts] = useState([])

  const getFloofs = async () => {
    try {
      let id = document.getElementById('app').getAttribute('data-id')
      const response = await fetch(`/api/v1/floofs/${id}`)
      if (!response.ok) {
        const errorMessage = `${response.status} (${response.statusText})`
        throw new Error(errorMessage)
      }
      const responseBody = await response.json()
      setPosts(responseBody.posts)
      setFloof(responseBody.floof)
    } catch (error) {
      console.error(`Error in Fetch: ${error.message}`)
    }
  }

  useEffect(() => {
    getFloofs()
  }, [])

  const addNewPost = async (formPayload) => {
    try {
      const response = await fetch("/api/v1/posts", {
        method: "POST",
        headers: {
          "Accept": "application/json",
          "content-Type": "application/json"
        },
        body: JSON.stringify(formPayload)
      })
      if (!response.ok) {
        const errorMessage = `${response.status} (${response.statusText})`
        throw new Error(errorMessage)
      }
      const newPost = await response.json()
      setPosts([...posts, newPost])
    } catch (error) {
      console.error(`Error in Fetch: ${error.message}`)
    }
  }

  let postTiles = posts.map(post => {
    return(
      <PostTile
        key={post.id}
        post={post}
        floof={floof}
      />
    )
  })

  return(
    <div>
      <h3>{floof.name} says...</h3>
      <h6>Floofiness rating: {floof.floofiness}</h6>
      <img src={floof.image} />
      <FormContainer
        addNewPost={addNewPost}
        floofId={floof.id}
      />
      {postTiles}
    </div>
  )
}

export default FloofFeed;
