import React from "react";

const Grocery = (props) => {
  const addeditem = () => {
    alert(`you have deleted something`);
  };

  return (
    <ul className="item">
      <li>
        {props.name}
        <button onClick={addeditem}> Delete </button>
      </li>
    </ul>
  );
};

export default Grocery;
