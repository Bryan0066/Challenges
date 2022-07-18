import React, { useState, useEffect } from 'react';

import "../assets/scss/main.scss"

const App = (props) => {
  const [count, setCount] = useState(0);

  // runs whenever the component renders
  useEffect(() => {
    // Update the document title (look at your browser tab!)
    document.title = `You clicked ${count} times` , [count]
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

export default App
 