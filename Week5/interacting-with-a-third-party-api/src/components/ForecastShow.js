import React, { useState, useEffect } from "react";

import ForecastTile from "./ForecastTile";

const ForecastShow = (props) => {
  const [forecast, setForecast] = useState({
    main: {},
    weather: [{}],
    clouds: {},
  });
  const [input, setInput] = useState("")

  useEffect(() => {
    fetchWeather();
  }, []);

  const fetchWeather = async () => {
    try {
      const city = "boston";
      const response = await fetch(`api/v1/forecast?city_name=${city}`);
      if (!response.ok) {
        const errorMessage = `${response.status} (${response.statusText})`;
        const error = new Error(errorMessage);
        throw error;
      }
      const weatherForecast = await response.json();
      setForecast(weatherForecast);
    } catch (err) {
      console.error(`Error in fetch: ${err.message}`);
    }
  };

  const handleChange = (event) => {
    setInput(event.currentTarget.value);
  };

  const handleSubmit = (event) => {
    event.preventDefault();
    fetchWeather(input);
    setInput("");
  };

  console.log(forecast);

  return (
    <div>
      <ForecastTile forecast={forecast} />
      <form onSubmit={handleSubmit}>
        <label>
          Enter a city to see the forecast:
          <input
            type="text"
            name="city"
            value={input}
            onChange={handleChange}
          />
        </label>
        <input type="submit" value="Submit" />
      </form>
    </div>
  );
};

export default ForecastShow;
