import React, { useState, useEffect } from 'react';

const App = (props) => {
  const fetchWeather = async () => {
    try {
      const city = "boston"
      const response = await fetch(`api/v1/forecast?city_name=${city}`);
      if (!response.ok) {
        const errorMessage = `${response.status} (${response.statusText})`
        const error = new Error(errorMessage);
        throw(error);
      }
      const weatherForecast = await response.json();
      console.log(weatherForecast);
    } catch(err) {
      console.error(`Error in fetch: ${err.message}`)
    }
  }

  useEffect(() => {
    // fetchWeather()
  }, [])

  return(
    <div>
      <h1>Interacting with a Third Party Api</h1>
    </div>
  )
}

export default App;
