// shipyard.js

import createNewSpaceShip from "./create-new-spaceship.js";
import createNewCrewmember from "./createNewCrewMember.js";
import createNewRocket from "./createNewRocket.js";

let ourShip = createNewSpaceShip("The Flying Dutchman");
let crewNames = ["Squidward", "Spongebob", "Mr. Krabs", "Gary", "Patrick"];
let ourFirstRocket = createNewRocket();

let launchpad = (ship, crewArray, rocket) => {
  rocket.addFuel();
  let crewObjArray = trainCrew(crewArray);
  ourShip.loadCrew(crewObjArray);
  let capitan = ourShip.capitan();
  console.log(`Welcome aboard the ${ship.name}!`);
  console.log(`${capitan} is the capitain!`);
  console.log("Initiating preflight procedures!");
  ourShip.mountPropulsion(rocket);
  rocket.fire()
  ship.countDown(3,rocket,ship.takeoff)
};

const trainCrew = (array) => {
  const newArray = [];

  array.map((element) => {
    let crewObj = createNewCrewmember(element);
    crewObj.trained = true;
    newArray.push(crewObj);
  });

  return newArray;
};

launchpad(ourShip, crewNames, ourFirstRocket);
