import React, { useState, useEffect } from "react";
import { Link } from "react-router-dom";

const CerealsIndex = (props) => {
  const [cereals, setCereals] = useState();

  useEffect(() => {
    fetchCereals();
  }, []);

  const fetchCereals = async () => {
    try {
      const response = await fetch("api/v1/cereal");
      if (!response.ok) {
        const errorMessage = `${response.status} (${response.statusText})`;
        throw new Error(errorMessage);
      }

      const responseBody = await response.json();
      let cereals = responseBody.cereal;
      setCereals(cereals);
    } catch (error) {
      console.error(`Error in Fetch: ${error.message} `);
    }
  };

  return( <p>REACT THIS BITCH</p>);
};

export default CerealsIndex;
