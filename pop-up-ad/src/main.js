import React from 'react';
import ReactDOM  from 'react';

import './app.scss';


// import components, if rendered in ReactDOM.render

// call on ReactDOM.render with the correct arguments

const message = <div>Hello from React!</div>
ReactDOM.render(

    message,
    document.getElementById("app")

) 


