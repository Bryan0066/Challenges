There are often instances where we need to perform actions when the page renders or state changes. React provides us with another hook, `useEffect`, as a way to _"hook into"_ these stages of the component lifecycle to insert our own functionality.

### Learning Goals

- Integrate `useEffect` into a React component
- Ensure `useEffect` does not execute unnecessarily

### Getting Started

```no-highlight
et get introduction-to-useEffect-in-sinatra-react
cd introduction-to-useEffect-in-sinatra-react
bundle exec bundle install && ruby server.rb
```

In a separate tab, run

```no-highlight
yarn install && yarn run dev:client
```

### useEffect

In React applications, when we perform actions such as fetching external data, or managing inactivity timeout, these are called `side effects`. These behaviors in our components cause state to change, the component to re-render, or perform interactions outside the scope of our component. In some instances, we may want to leverage or listen to these side effects. That's where `useEffect` can help!

`useEffect` is a function from React that allows us to trigger specific functionality when a page renders, or if a specific targeted value or state changes. Let's review when a component will render/re-render, as that is what we will want to hook into first:

1. on the component's initial render to the DOM
2. when new props are passed to the component
3. when the state of the component updates with new values

With `useEffect`, we can hook in some functionality whenever the component re-renders.

`useEffect` is available to us via the React library, and can be imported as shown below:

```js
import React, { useState, useEffect } from "react"
```

Here, we can `import` multiple functions present in the `React` namespace.

Let's see it in action in our `App` component located in `components/App.js`:

```js
import React, { useState, useEffect } from 'react';
...
const App = (props) => {
  const [count, setCount] = useState(0);

  // runs whenever the component renders
  useEffect(() => {
    // Update the document title (look at your browser tab!)
    document.title = `You clicked ${count} times`;
  });

  const increaseCount = () => {
    setCount(count + 1)
  }

  return (
    <div>
      <p>You clicked {count} times</p>
      <button onClick={increaseCount}>
        Click me
      </button>
    </div>
  );
}
...
```

`useEffect`'s first and most essential argument is a callback function that is called whenever the component re-renders (specifically, if we do not pass it a second argument. More on this later). We've wired the callback function here to change the document title based on button clicks.

Your browser tab should display `You clicked 0 times` as its title to start. In this case, `document.title = You clicked ${count} times;` ran after the component first renders.

Clicking on the "Click me" button increases the `count` state. Upon that state changing, the component re-renders, which triggers `useEffect` once more.

`useEffect` can be implemented in many other ways, triggering updates when certain values or state change, and can hook into a lot of more advanced implementations. Initially, we will be focused on hooking in functionality _only when a component first renders_, particularly when making a request with the Fetch API. Let's take a look at a simpler example first.

Let's make our `App` component only update the title when the component *first *renders. Update the call to `useEffect` to have the following updated code. **Note that the only change is that `useEffect` is receiving a second argument of an empty array.**

```js
useEffect(() => {
  // Update the document title (look at your tab!)
  document.title = `You clicked ${count} times`
}, [])
```

The title of your webpage should no longer update as long as you have passed this `[]` as the second argument to useEffect.

We've told `useEffect` to skip running it's callback function for all cases except the initial render. `useEffect'`s second, optional argument is an array of dependency values that will trigger `useEffect` to run. If we pass no second argument (no array), then we are telling `useEffect` to run on every render. But by passing an empty array, we are telling our component that there is no variable or piece of state that should trigger `useEffect`, _only_ the initial render. This is how we will often use `useEffect` with the Fetch API.

### Dependencies

We can also give ourselves even more control over when `useEffect` should run. By adding variables into the `useEffect` dependencies array, we are effectively saying: _" only execute the `useEffect` if any of these values change."_ That is, in addition to the initial render.

Let's update our `useEffect` to have the `count` state in its dependencies:

```javascript
useEffect(() => {
  // Update the document title (look at your tab!)
  document.title = `You clicked ${count} times`
}, [count])
```

Here, we have added an array as the second argument to `useEffect` but this time with the state variable `count` inside. In this way, we've constrained when `useEffect` invokes. Our `useEffect` callback function only executes when the value of `count` changes. _Dependencies_ like `count` help optimize our applications to ensure we don't encounter unnecessary re-renders. Now, our app will go back to updating our webpage title, because `useEffect` is re-running when `count` is updated.

There is more we can do with `useEffect`, but these two functionalities serve us well for a majority of our web application's intended functionality.

### The Infinite Loop

An important thing to keep in mind is, we don't want to run into a situation where our `useEffect` is updating something that is in its list of dependencies. This would result in an infinite loop, because each run of the `useEffect` would tell the `useEffect` to run again!

To show an example of this, instead of importing static data into React, we will now issue `fetch` requests to retrieve data from our backend server, where this second argument of an empty array is crucial. The `useEffect` hook is a great place to set up a `fetch` request because we can make a request right after the initial render of the component, and then update state with the retrieved data.

Remember too that updating state is an action that causes the component to _re-render_, which also triggers `useEffect`. If we setup `fetch` and `useEffect` without the second argument `[]`, we could find ourselves in an infinite loop.

Let's examine two scenarios. One where we get caught in an infinite loop, and one in which our application runs smoothly. **If the application in your browser or your terminal stalls, you can always shut down the running server in your terminal to end the process.**

Update `useEffect` in the App component to makes a fetch request, and then set the body of the fetch request's response in state. Don't worry if some of the fetch syntax feels new to you. Just know that it will retrieve a random number and then set that number in state. We have provided an endpoint in this application's backend server to respond to our fetch request. Visit your webpage. Examine how `useEffect` runs differently with the addition of the dependency array by adding and removing the dependency array as the second argument, `, []`:

```js
// components/App.js
const fetchRandomNumber = async () => {
  try {
    const response = await fetch("/api/v1/randomNumber")
    const newRandomCount = await response.json()
    // upon receiving the data, we will want to set it in state with the setter, similar to below
    setCount(newRandomCount)
  } catch (err) {
    console.error(`Error in fetch: ${err.message}`)
  }
}
// runs whenever the component renders
useEffect(() => {
  // fetch request for data
  fetchRandomNumber()
}, []) // <- try with and without!
```

Without the second argument `[]`,

- `useEffect` calls on `fetchRandomNumber` after initial render
- Once the fetch request is complete, we parse the response and get the random number with `response.json()`
- we set this `newRandomCount` in state
- the component re-renders, because state has changed
- `useEffect` gets called again, starting the process over at the beginning
- the browser console should be red with an infinite re-render error!

We want this `useEffect` hook to only run after the initial render, the first time it gives us a new random number. With the modification of that empty array, our application will run as intended: only on the initial render, and without infinite loops or stalling!

With the second argument `[]`,

- `useEffect` calls on `fetchRandomNumber` after initial render
- Once the fetch request is complete, we parse the response and get the random number with `response.json()`
- we set this `newRandomCount` in state
- the component re-renders as intended, because state has changed
- the new number is displayed on the page correctly, and `useEffect` is not called again

### Why This Matters

React's hooks allow us to control what happen's during a component's lifecycle. The `useEffect` hook is incredibly valuable because it allows us to trigger a callback function when the component first renders, when it re-renders, or when a specific dependency changes. By managing side effects through `useEffect`, we are able to integrate more complex and interesting types of functionality in our React apps.
