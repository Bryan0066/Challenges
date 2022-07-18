// post livecode code... I promise this is the (3rd and) final submission.

const generateRandomRolltime = () => {
  return Math.floor(Math.random() * (60 - 10 + 1) + 10);
};

//Data set
const rawDataArray = [
  {
    cheeseName: "Red Leicester",
    cheeseDeliciousness: 9,
    contestantName: "John C",
    contestantHunger: 8,
  },
  {
    cheeseName: "Tilsit",
    cheeseDeliciousness: 3,
    contestantName: "Michael P",
    contestantHunger: 10,
  },
  {
    cheeseName: "Caerphilly",
    cheeseDeliciousness: 5,
    contestantName: "Eric I",
    contestantHunger: 2,
  },
  {
    cheeseName: "Bel Paese",
    cheeseDeliciousness: 4,
    contestantName: "Graham C",
    contestantHunger: 4,
  },
  {
    cheeseName: "Red Windsor",
    cheeseDeliciousness: 9,
    contestantName: "Terry G",
    contestantHunger: 6,
  },
  {
    cheeseName: "Stilton",
    cheeseDeliciousness: 7,
    contestantName: "Terry J",
    contestantHunger: 1,
  },
  {
    cheeseName: "Gruyere",
    cheeseDeliciousness: 2,
    contestantName: "Carol C",
    contestantHunger: 6,
  },
];

const registerContestants = (contestantsData) => {
  const newArrayOfContestants = contestantsData.map((contestant) => {
    const formattedcontestant = {
      name: contestant.contestantName,
      hunger: contestant.contestantHunger,
      cheese: {
        name: contestant.cheeseName,
        deliciousness: contestant.cheeseDeliciousness,
      },
      isDisqualified: false,
      results: [],

      checkForCheeseEating() {
        const avg = (this.hunger + this.cheese.deliciousness) / 2;
        if (avg >= 7) {
          this.isDisqualified = true;
        }
      },

      rollDatCheese() {
        if (this.isDisqualified === false) {
          const roll = generateRandomRolltime();
          this.results.push(roll);
        }
      },

      reportIndividualResults() {
        result = `Contestant ${this.name} entered this competiton with a loveley ${this.cheese.name}.\n`;
        if (this.isDisqualified == false) {
          return (
            result +
            `By not eating their cheese, they were able to complete with resulting scores of ${this.results}\n\n`
          );
        } else {
          return (
            result +
            `Unfortunately, but fortunately for them, they ate their cheese. This resulted in a disqualification.\n\n`
          );
        }
      },
    };

    return formattedcontestant;
  });

  return newArrayOfContestants;
};

const contestants = registerContestants(rawDataArray);

contestants.forEach((contestant) => {
  contestant.checkForCheeseEating();

  contestant.rollDatCheese();
  contestant.rollDatCheese();
  contestant.rollDatCheese();
});

contestants.forEach((contestant) => {
  console.log(contestant.reportIndividualResults());
});
