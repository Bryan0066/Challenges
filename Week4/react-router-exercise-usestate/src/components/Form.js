import React from 'react';

const Form = props => {
  return(
    <form className='content'>
      <input type="text" onChange={props.handleName}/>
      <select onChange={props.handleType}>
        <option value="greeting">Greeting</option>
        <option value="goodbye">Goodbye</option>
      </select>
    </form>
  )
}

export default Form;
