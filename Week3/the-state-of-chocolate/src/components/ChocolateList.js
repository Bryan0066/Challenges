import React, { useState } from "react";

const ChocolateList = (props) => {
  const chocolateData = [
    "Cadbury Chocolate Bar",
    "Lindt 90% Dark Chocolate",
    "Hershey's Special Dark",
    "Lily's Sugar Free Chocolate",
    "Crunch",
    "Toblerone",
  ];

  const [chocolateVisibility, setChocolateVisibility] = useState(false);

  let coco = null;

  let chocolateListItems = chocolateData.map((chocolate) => {
    let key = Math.random();
    return <li key={key}>{chocolate}</li>;
  });

  const chocolateClick = () => {
    if (!chocolateVisibility) {
      setChocolateVisibility(true);
    }
  };

  if (chocolateVisibility === false) {
    chocolateListItems = null;
  }
  return (
    <div id="chocolate-app">
      <h1 onClick={chocolateClick}>Chocolates!</h1>
      <ul>{chocolateListItems}</ul>
    </div>
  );
};

export default ChocolateList;
