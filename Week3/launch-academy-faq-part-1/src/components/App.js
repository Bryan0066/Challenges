import React from 'react';
import QuestionTileList from './questionTileList';

const App = (props) => {
  return(
    <div>
        <QuestionTileList
            data={props.data}
        />
  </div>
  )
}

export default App;
