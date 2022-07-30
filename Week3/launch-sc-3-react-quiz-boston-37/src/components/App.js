import React from 'react';
import TileList from './tileList';

const App = (props) => {
  return(
    <div>
      <TileList
      data={props.data}/>
    </div>
  )
}

export default App
