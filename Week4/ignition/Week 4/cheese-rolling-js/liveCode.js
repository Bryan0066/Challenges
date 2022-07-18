// generate a random integer between 10 and 60
const generateRandomRolltime = () => {
  return Math.floor(Math.random() * (60 - 10 + 1) + 10)
}

const rawDataArray = [
  {
    cheeseName: "Red Leicester",
    cheeseDeliciousness: 9,
    contestantName: "John C",
    contestantHunger: 8
  },
  {
    cheeseName: "Tilsit",
    cheeseDeliciousness: 3,
    contestantName: "Michael P",
    contestantHunger: 10
  },
  {
    cheeseName: "Caerphilly",
    cheeseDeliciousness: 5,
    contestantName: "Eric I",
    contestantHunger: 2
  },
  {
    cheeseName: "Bel Paese",
    cheeseDeliciousness: 4,
    contestantName: "Graham C",
    contestantHunger: 4
  },
  {
    cheeseName: "Red Windsor",
    cheeseDeliciousness: 9,
    contestantName: "Terry G",
    contestantHunger: 6
  },
  {
    cheeseName: "Stilton",
    cheeseDeliciousness: 7,
    contestantName: "Terry J",
    contestantHunger: 1
  },
  {
    cheeseName: "Gruyere",
    cheeseDeliciousness: 2,
    contestantName: "Carol C",
    contestantHunger: 6
  }
]

const registerContestants = (contestantsData) => {
  // console.log(contestantsData)
  const newArrayOfContestants = contestantsData.map((contestant) => {
    // console.log(contestant)
    const formattedContestant = {
      name: contestant.contestantName,
      hunger: contestant.contestantHunger,
      cheese: {
        name: contestant.cheeseName,
        deliciousness: contestant.cheeseDeliciousness
      },
      isDisqualified: false,
      results: [],

      checkForCheeseEating() {
        // console.log("check for cheese!")
        // console.log(this.hunger)
        const average = (this.hunger + this.cheese.deliciousness) / 2
        console.log(average)

        console.log(average >= 7)
        if (average >= 7) {
          this.isDisqualified = true
        }
      },

      rollDatCheese() {
        // if (!this.isDisqualified) {

        // this.checkForCheeseEating()

        if (this.isDisqualified === false) {
          const randomTime = generateRandomRolltime()
          this.results.push(randomTime)
        }
      },

      reportIndividualResults() {
        if (this.isDisqualified) {
          return `Contestant ${this.name} entered the competition with a delicious ${this.cheese.name}. Unfortunately, they they were starving and ate their cheese and were disqualified :(`
        } else {
          return `Contestant ${this.name} entered the competition with a delicious ${this.cheese.name}. By meeting the criteria they were able to compete with scores of ${this.results}.`
        }
      }
    }

    return formattedContestant
  })

  return newArrayOfContestants
}

const contestants = registerContestants(rawDataArray)

// console.log(contestants)

// console.log(contestants[0])
// console.log(contestants[0].checkForCheeseEating())
// console.log(contestants[0])

// console.log(contestants[1].rollDatCheese())
// console.log(contestants[1])

contestants.forEach((contestant) => {
  contestant.checkForCheeseEating()

  contestant.rollDatCheese()
  contestant.rollDatCheese()
  contestant.rollDatCheese()
})

// console.log(contestants[0].reportIndividualResults())
// console.log(contestants[1].reportIndividualResults())
// console.log(contestants)

contestants.forEach((contestant) => {
  // contestant.reportIndividualResults()
  console.log(contestant.reportIndividualResults())
})