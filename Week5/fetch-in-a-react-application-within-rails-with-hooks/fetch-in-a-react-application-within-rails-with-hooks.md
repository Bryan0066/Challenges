## Learning Objectives

- Fetch data from a Rails API endpoint via Fetch API in React.

## Following Along

The repository we are working with can be retrieved using et. To get quickly set up, do the following:

- Et get the repository, install the necessary gems, set up the database, and run the rails server.

  ```no-highlight
  et get fetch-in-a-react-application-within-rails-with-hooks
  cd fetch-in-a-react-application-within-rails-with-hooks
  bundle install
  bundle exec rake db:create
  bundle exec rake db:migrate
  bundle exec rake db:seed
  bundle exec rails server -b 0.0.0.0
  ```

- In another tab, install the necessary NPM packages and run your Webpack Dev Server

  ```no-highlight
  yarn install
  yarn run dev:client
  ```

- In your browser open `localhost:3000`

## Lay of the Land 

All of your React code will exist in `app/javascript` folder, a folder managed separately by webpack. The JS code will automatically be served up on any normal HTTP request because that code is linked in your layout file. Where you see `  <%= javascript_pack_tag 'application' %>` is where your React code is linking to a `bundle.js` that contains React. This is done for you, and allows React to be used on any page that has a `<div>` with an id of `app`. 


```html
<body>

  <%- flash.each do |key, value| -%>
    <div class="flash flash-<%= key %>">
      <%= value %>
    </div>
  <%- end -%>

  <%= yield %>

  <%= javascript_include_tag 'application' %>
  
  <%- if Rails.env.development? || Rails.env.test? -%> 
    <%= javascript_tag do %>
      window.railsEnv = '<%= Rails.env %>'
    <%- end -%>
  <%- end -%>
  <%= javascript_pack_tag 'application' %>
  
  <%= yield :extra_footer %>
</body>
```

Your top level React file that renders your React app initially will now be `app/javascript/packs/application.js`. This file may have some extra content in for error handling, but otherwise still contains:

```jsx
  render(<App />, reactElement)
```

Where `reactElement` is the div with an id of app, and `<App>` is your top level component.

`app/javascript/components` is where you will create your React components and store any files specific to React. Beyond ensuring that your controllers skip authenticity tokens, and your React fetch requests have the appropriate information in them, your React app will automatically make requests to localhost:3000. You should have a rails and yarn server running to develop from this point on.

## Setting Up The App

We have written the following `Fortune` component in `app/javascript/components/Fortune.js`:

```javascript
import React, { useState } from 'react';

const Fortune = () => {
  const [getFortune, setFortune] = useState(null)

  return (
    <h1>Your Fortune: {getFortune}</h1>
  );
}

export default Fortune
```

Our Rails application displays this component at our root index. If we visit the page, we see the following:

![Fetch in Rails React 1][fetch-in-rails-react-1]

We have also built the following API endpoint in our Rails application that returns a random fortune:

```ruby
#app/controllers/api/v1/fortunes_controller.rb
class Api::V1::FortunesController < ApiController
  def show
    render json: { fortune: Fortune.all.sample }
  end
end
```

Note how this controller looks distinct from controllers in the past. Under the hood, this controller is exactly the same as ones in the past, but is "namespaced" under `Api::V1::` to denote that this is a controller for responding to API requests (which will take the form of fetch requests). It also responds with a `json` response instead of an HTML response. But your ActiveRecord queries will be the same.

To accomodate this, we've needed to make one change in the `routes.rb` file: 

```ruby
 namespace :api do
    namespace :v1 do 
      resource :fortune, only: [:show, :create]
    end
  end
```
The `namespace` keyword simply changes the path needed to make a request to our new controller, and will also mean that your folder structure will change. Take note of how this `pi::V1::FortunesController` is located at `app/controllers/api/v1/fortunes_controller.rb`. All new API controllers should be similarly nested in this folder structure.

## Good Fortune Comes to Those That Build with React

We can test the API endpoint by visiting: `localhost:3000/api/fortune`
And we should see a JSON of a random fortune:

```json
{"fortune":{"id":29,"text":"Keep it short for pithy sake."}}
```

We would like our component to display a random fortune from the API. We can accomplish this by calling fetch once the component mounts and setting the new state with the returned fortune if the fetch response is successful. We update our component as such:

```javascript
import React, { useState, useEffect } from "react"

const Fortune = () => {
  const [getFortune, setFortune] = useState("")

  const fetchFortune = async () => {
    try {
      const response = await fetch("/api/v1/fortune")
      if (!response.ok) {
        const errorMessage = `${response.status} (${response.statusText})`
        throw new Error(errorMessage)
      }
      const responseBody = await response.json()
      let fortune = responseBody.fortune.text
      setFortune(fortune)
    } catch (error) {
      console.error(`Error in Fetch: ${error.message}`)
    }
  }

  useEffect(() => {
    fetchFortune()
  }, [])

  return (
    <h1>Your Fortune: {getFortune}</h1>
  );
}

export default Fortune

```

If we visit our root path again, we now see the following:

![Fetch in Rails React 2][fetch-in-rails-react-2]

You may however get a different fortune due to the fortunes now appearing randomly.

We use the hook `useEffect` to invoke our `fetchFortune` fetch request once the component mounts. The hook method runs, calling the fetch request within `fetchFortune` to our rails endpoint which will retrieve a random fortune as JSON. We then parse that JSON, use our setFortune setter (provided in `useState`) to set the state of our Fortune component to the newly retrieved fortune from our api, and finally trigger a re-render so that our newly updated Fortune Component displays on the page with the retrieved fortune!
Since we've included an empty array as the second argument to our `useEffect` the hook won't run a second time unless something causes it to.

### Retrieving more Fortunes using Fetch

Receiving a random fortune when the page loads is nice, but it would be nicer if we added a button that we could click to retrieve a new fortune. Fortunately, we do not need to create a new Rails API endpoint to retrieve the new random fortune; we already have `localhost:3000/api/fortune`. Therefore, we only need to incorporate the button within React.

Let's create our button in our render function in `app/javascript/components/Fortune.js` as well as a `handleClick` function that will essentially make the same fetch call as our `useEffect` method:

```javascript
import React, { useState, useEffect } from "react"

const Fortune = () => {
  const [getFortune, setFortune] = useState("")
  
  const fetchFortune = async () => {
    try {
      const response = await fetch("/api/v1/fortune")
      if (!response.ok) {
        const errorMessage = `${response.status} (${response.statusText})`
        throw new Error(errorMessage)
      }
      const responseBody = await response.json()
      let fortune = responseBody.fortune.text
      setFortune(fortune)
    } catch (error) {
      console.error(`Error in Fetch: ${error.message}`)
    }
  }

  useEffect(() => {
    fetchFortune()
  }, [])

  const handleClick = async () => {
    try {
      const response = await fetch("/api/v1/fortune")
      if (!response.ok) {
        const errorMessage = `${response.status} (${response.statusText})`
        throw new Error(errorMessage)
      }
      const responseBody = await response.json()
      let fortune = responseBody.fortune.text
      setFortune(fortune)
    } catch (error) {
      console.error(`Error in Fetch: ${error.message}`)
    }

  return (
    <>
    <h1>Your Fortune: {getFortune}</h1>
    <button className="button" onClick={handleClick}> Click for a new Fortune </button>
    </>
  );
}

export default Fortune
```

Because we're making the same fetch call twice, we can refactor our code in `useEffect` and `handleClick` into a single method:

```javascript
import React, { useState, useEffect } from "react"

const Fortune = () => {
  const [getFortune, setFortune] = useState("")

  const fetchFortune = async () => {
    try {
      const response = await fetch("/api/v1/fortune")
      if (!response.ok) {
        const errorMessage = `${response.status} (${response.statusText})`
        throw new Error(errorMessage)
      }
      const responseBody = await response.json()
      let fortune = responseBody.fortune.text
      setFortune(fortune)
    } catch (error) {
      console.error(`Error in Fetch: ${error.message}`)
    }
  }

  useEffect(() => {
    fetchFortune()
  }, [])

  const handleClick = () => {
    fetchFortune()
  }

  return (
    <>
    <h1>Your Fortune: {getFortune}</h1>
    <button className="button" onClick={handleClick}> Click for a new Fortune </button>
    </>
  );
}

export default Fortune
```

Now if we visit the page we should see the following:

![Fetch in Rails React 3][fetch-in-rails-react-3]

## POST in React using Fetch

We can also use `fetch` to post information. Because a `POST` fetch request creates something in our application, Rails has further securities that would prevent us from using session information (which we would need if wanted to access a user session if we allowed for user authentication with a library like Devise). Let's set up our React application to incorporate a form. We'll need to add an additional header to our `POST` fetch request:

```javascript
import React, { useState, useEffect } from "react"

const Fortune = () => {
  const [getFortune, setFortune] = useState("")
  const [getNewFortune, setNewFortune] = useState("")

  const fetchFortune = async () => {
    try {
      const response = await fetch("/api/v1/fortune")
      if (!response.ok) {
        const errorMessage = `${response.status} (${response.statusText})`
        throw new Error(errorMessage)
      }
      const responseBody = await response.json()
      let fortune = responseBody.fortune.text
      setFortune(fortune)
    } catch (error) {
      console.error(`Error in Fetch: ${error.message}`)
    }
  }

  useEffect(() => {
    fetchFortune()
  }, [])

  const handleClick = () => {
    fetchFortune()
  }

  let handleChange = (event) => {
    setNewFortune(event.currentTarget.value)
  }

  let handleSubmit = async (event) => {
    event.preventDefault()
    let formPayload = {
      fortune: getNewFortune
    }

    try {
      const response = await fetch("/api/v1/fortune", {
        credentials: "same-origin",
        method: "POST",
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json"
        },
        body: JSON.stringify(formPayload)
      })
      if (!response.ok) {
        const errorMessage = `${response.status} (${response.statusText})`
        throw new Error(errorMessage)
      }
      const responseBody = await response.json()
      let newFortune = responseBody.fortune.text
      setFortune(newFortune)
    } catch (error) {
      console.error(`Error in Fetch: ${error.message}`)
    }
  }

  return(
    <>
    <h1>Your Fortune: {getFortune}</h1>
    <button className="button" onClick={handleClick}> Click for a new Fortune </button>
    <form onSubmit={handleSubmit}>
          <label>New Fortune:</label>
          <input
            type="text"
            value={getNewFortune}
            onChange={handleChange}
          />
          <input type="submit" value="Submit" />
        </form>
    </>
  );
}

export default Fortune
```

Now the only thing left to do is create a controller action to process the posting of the form:

```ruby
#app/controllers/api/fortunes_controller.rb
class Api::V1::FortunesController < ApiController
  protect_from_forgery unless: -> { request.format.json? }

  def show
    render json: { fortune: Fortune.all.sample }
  end

  def create
    fortune = Fortune.new(text: params[:fortune])
    if fortune.save
      render json: { fortune: fortune }
    else
      render json: { error: fortune.errors.full_messages }, status: :unprocessable_entity
    end
  end
end
```

Now we have the ability to see the form:

![Fetch in Rails React 4][fetch-in-rails-react-4]

Fill out the form:

![Fetch in Rails React 5][fetch-in-rails-react-5]

And see our newly created fortune:

![Fetch in Rails React 6][fetch-in-rails-react-6]

We can even check the last fortune to see if it matches our newly created fortune:

```sh
$ bundle exec rails console
$ Fortune.last
# => #<Fortune:0x007f9502fc7170 id: 46, text: "Hey I'm a new Fortune">
```

### Key differences between Fetch GET and Fetch POST

- Fetch by default will perform an HTTP GET request, so the `handleSubmit` fetch call will take in a set of parameters, including the HTTP method.

- The other parameters include the content type to specify that the data being posted is in a JSON format, the body which is set to the data being posted, and finally the credentials. Because we are manipulating data in our database, we must specify that the fetch call is coming from the same origin as our rails application.

- The create action in our Rails controller requires the `protect_from_forgery unless: -> { request.format.json? }` for our create action in order to successfully access the data sent with the fetch request.

- Finally, we set the state of our fortune to the newly created fortune.

## Summary

In a React application set up within a Rails application, we are able to fetch data from a Rails API endpoint for the React application. We accomplish this through the use of Fetch API and React useEffect hook. With such knowledge, we are now able to leverage both the power of a Rails back-end and the responsiveness of a React front-end in our website!

[fetch-in-rails-react-1]: https://s3.amazonaws.com/horizon-production/images/fetch-in-rails-react-1.png
[fetch-in-rails-react-2]: https://s3.amazonaws.com/horizon-production/images/fetch-in-rails-react-2.png
[fetch-in-rails-react-3]: https://s3.amazonaws.com/horizon-production/images/fetch-in-rails-react-3.png
[fetch-in-rails-react-4]: https://s3.amazonaws.com/horizon-production/images/fetch-in-rails-react-4.png
[fetch-in-rails-react-5]: https://s3.amazonaws.com/horizon-production/images/fetch-in-rails-react-5.png
[fetch-in-rails-react-6]: https://s3.amazonaws.com/horizon-production/images/fetch-in-rails-react-6.png
