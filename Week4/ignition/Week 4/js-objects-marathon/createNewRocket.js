

const createNewRocket = () => {
    const rocket = {
        fuel: 0,
        addFuel: () => {
            rocket.fuel += 1
        },
        fire: () => {

            if (rocket.fuel >= 1) {
                console.log(`Fuel level: ${rocket.fuel}`)
                console.log(`Engines Fired!`)
                rocket.fuel -= 1
                return true
            } else {
                console.log(`Engines Firing failed: Insufficient fuel`)
                return false
            }

        }
    }
    return rocket
}

export default createNewRocket