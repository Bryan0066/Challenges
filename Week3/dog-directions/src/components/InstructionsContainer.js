import React, { useState } from "react"
import StepTile from "./StepTile"
import ItemTile from "./ItemTile"
import FetchButton from "./FetchButton"

const InstructionsContainer = props => {
  const supplies = props.data.supplies
  const directions = props.data.directions

  const [stepSelected, setSelectedStep] = useState(directions.id)

  const items = supplies.map(supply => {
    return (
      <ItemTile
        item={supply.item}
        key={supply.id}
        id={supply.id}
      />
    )
  })


  const steps = directions.map(direction => {

    const setSelectedStepClosure = () => {
        setSelectedStep(direction.id)
      }
    let className = "body";
    directions
    if (direction.id === stepSelected) {
      className = "selected";
    }
    return (
      <StepTile
        step={direction.step}
        key={direction.id}
        id={direction.id}
        className={className}
        onClick={setSelectedStepClosure}
      />
    )
  })

  return (
    <div>
      <h1>How To {props.data.activity}</h1>
      <h3>Supplies:</h3>
      <ul>{items}</ul>
      <h3>Instructions:</h3>
      <ol>{steps}</ol>
      <FetchButton />
    </div>
  )
}

export default InstructionsContainer
