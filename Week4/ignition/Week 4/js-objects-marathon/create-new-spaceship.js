//create new spaceship

const createNewSpaceship = (name) => {
    const ship = {
        name,
        crew: [],
        propulsion: null,

        loadCrew: (array) => {
            array.forEach((element) => {
                ship.crew.push(element);
                console.log(`${element.name} is now aboard the ${ship.name}!`);
            });
        },
        capitan: () => {
            const number = ship.crew.length;
            const randomNumber = Math.floor(Math.random() * number);
            return ship.crew[randomNumber].name;
        },
        mountPropulsion: (rocketobj) => {
            ship.propulsion = rocketobj;
            console.log(`Propulsion mounted.`);
        },
        takeoff: (rocketobj) => {
            let result = rocketobj.fire;
            if (result) {
                console.log("PPPPFFFCCCSSHSHHHOOOOOTTTTTTTTTCCHHH\nLIFT OFF");
            } else {
                console.log(`Takeoff unsucessful`);
            }
        },

        countDown(startTime,rocketobj,callbackFn) {
            setTimeout(() => {
            if (startTime != 0) {
            console.log(startTime)
            this.countDown(startTime - 1)
            startTime --
            }},"1000")
            callbackFn(rocketobj)
        }
    }
    return ship
}

export default createNewSpaceship;
