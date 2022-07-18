class Contestant {
    constructor(name, hunger, cheeseName, cheeseDeliciousness) {
      this.name = name
      this.hunger = hunger
      this.cheese = {
        name: cheeseName,
        deliciousness: cheeseDeliciousness
      }
      this.disqualified = false
      this.results = []
    } 
  
    checkForCheeseEating() {
      if ((this.hunger + this.cheese.deliciousness) / 2 >= 7) {
        this.disqualified = true
      }
    }
  
    rollDatCheese() {
      if (!this.disqualified) {
        const randomTime = Math.floor(Math.random() * (60 - 10 + 1) + 10)
        this.results.push(randomTime)
      }
    }
  
    reportIndividualResults() {
      if (this.disqualified === false) {
        console.log(`Contestant ${this.name} entered this competition with a lovely ${this.cheese.name}. By meeting the criteria, they were able to compete with resulting scores of ${this.results}.`)
      } else if (this.disqualified === true) {
        console.log(`${this.cheese.name} is too delicious! So delicious that ${this.name} ate it and got disqualified.`)
      }
    }
  }
  
  export default Contestant