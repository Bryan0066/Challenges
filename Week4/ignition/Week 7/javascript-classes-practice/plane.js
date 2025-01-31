class Plane {
    constructor (make,model, capacity){
        this.make = make
        this.model = model
        this.capacity = capacity
        this.passengerCount = 0
    }
    board () {
        if (this.passengerCount < this.capacity){
            this.passengerCount += 1
            console.log(`The plane has ${this.passengerCount} passengers of an allowed ${this.capacity}`)
        }
        else {
            console.log('This plane is at capacity!')

        }
    }
}

export default Plane;