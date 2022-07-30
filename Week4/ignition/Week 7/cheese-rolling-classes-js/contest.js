import Contestant from "./Contestant.js"

class Contest {
  registerContestants(dataArray) {
    this.contestants = dataArray.map((contestant) => {
      const newContestant = new Contestant (contestant.contestantName, contestant.contestantHunger, contestant.cheeseName, contestant.cheeseDeliciousness)
      return newContestant
    })
  }

  runContest(numberOfRolls) {
    this.contestants.forEach((contestant) => {
      contestant.checkForCheeseEating()
      for (let i = 0; i < numberOfRolls; i++) {
        contestant.rollDatCheese()
      }
    });
  }

  reportResults() {
    this.contestants.forEach((contestant) => {
      contestant.reportIndividualResults()
    })
  }
}

export default Contest