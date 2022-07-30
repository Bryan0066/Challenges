import React from "react";

const ForecastTile = (props) => {
    const data = props.forecast

    return(
        <div>
            <h1>Forecast for {data.name}...</h1>
            <ul>
                <li>Temp: {data.main.temp}</li>
                <li>Feels-Like: {data.main.feels_like}</li>
                <li>Conditions: {data.weather[0].description}</li>
            </ul>

            
        </div>
        
        
    )
}
export default ForecastTile