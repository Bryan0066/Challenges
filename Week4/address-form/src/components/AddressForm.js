import React, { useState }from "react";

const AddressForm = (props) => {
  const [informationRecord, setInformationRecord] = useState({
    firstName: "",
    lastName: "",
    address: "",
    city: "",
    state: "",
    zipCode: "",
    phoneNumber: "",
    email: "",
  });

  const handleInputChange = (event) => {
    event.preventDefault()
    setInformationRecord({
      ...informationRecord,
      [event.currentTarget.name]: event.currentTarget.value,
    });
  };

  const showInfo = () => {
    console.log(`FirstName: ${informationRecord.firstName}`)
  }

  return (
    <form className="callout secondary" id="shipping-address-form">
      <h1>Shipping Address</h1>
      <div>
        <label htmlFor="firstName">First Name:</label>
        <input 
        type="text" 
        id="firstName" 
        name="firstName" 
        onChange={handleInputChange}
        value={informationRecord.firstName}
        />
      </div>

      <div>
        <label htmlFor="lastName">Last Name:</label>
        <input 
        type="text" 
        id="lastName" 
        name="lastName"
        onChange={handleInputChange}
        value={informationRecord.lastName}
        />
      </div>

      <label htmlFor="address">Address:</label>
      <input 
      type="text" 
      id="address" 
      name="address" 
      onChange={handleInputChange}
      value={informationRecord.address}
      />

      <div>
        <label htmlFor="city">City:</label>
        <input 
        type="text" 
        id="city" 
        name="city" 
        onChange={handleInputChange}
        value={informationRecord.city}
        />
      </div>

      <div>
        <label htmlFor="state">State:</label>
        <input 
        type="text" 
        id="state" 
        name="state"
        onChange={handleInputChange}
        value={informationRecord.state}
        />
      </div>

      <div>
        <label htmlFor="zipCode">Zip Code:</label>
        <input 
        type="text" 
        id="zipCode" 
        name="zipCode"
        onChange={handleInputChange}
        value={informationRecord.zipCode}
        />
      </div>

      <div>
        <label htmlFor="phoneNumber">Phone Number:</label>
        <input 
        type="text"
        id="phoneNumber" 
        name="phoneNumber" 
        onChange={handleInputChange}
        value={informationRecord.phoneNumber}
        />
      </div>

      <div>
        <label htmlFor="email">Email:</label>
        <input 
        type="text" 
        id="email" 
        name="email" 
        onChange={handleInputChange}
        value={informationRecord.email}
        />
      </div>

      <input type="button" className="button" value="Submit" onClick={showInfo} />
    </form >
  );
};

export default AddressForm;
