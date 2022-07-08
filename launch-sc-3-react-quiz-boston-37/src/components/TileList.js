import React, { useState } from "react";
import Tile from "./Tile";

const TileList = (props) => {
  const question = props.data.question;


  const [seletedTile, setSelectedTile] = useState(question.answers.id);

  const answerOptions = question.answers.map ((answer) => {
    
    const clickTile = () => {
        setSelectedTile(answer.id)
    }
    let className
    if ( answer.id === seletedTile ){ 
        className = "selected"
    }


    return(
      
        <Tile 
        key={answer.id}
        body={answer.body}
        className={className}
        clickTile={clickTile}
        />

    )
  })

  return (
    <div >
      <h1>{question.body}</h1>
      {answerOptions}
    </div>
  );
};

export default TileList;
