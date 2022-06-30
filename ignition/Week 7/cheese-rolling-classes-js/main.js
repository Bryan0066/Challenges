import Contest from "./contest.js"

const rawDataArray = [
  {
    cheeseName: 'Red Leicester',
    cheeseDeliciousness: 9,
    contestantName: 'John C',
    contestantHunger: 8
  },
  {
    cheeseName: 'Tilsit',
    cheeseDeliciousness: 3,
    contestantName: 'Michael P',
    contestantHunger: 10
  },
  {
    cheeseName: 'Caerphilly',
    cheeseDeliciousness: 5,
    contestantName: 'Eric I',
    contestantHunger: 2
  },
  {
    cheeseName: 'Bel Paese',
    cheeseDeliciousness: 4,
    contestantName: 'Graham C',
    contestantHunger: 4
  },
  {
    cheeseName: 'Red Windsor',
    cheeseDeliciousness: 9,
    contestantName: 'Terry G',
    contestantHunger: 6
  },
  {
    cheeseName: 'Stilton',
    cheeseDeliciousness: 7,
    contestantName: 'Terry J',
    contestantHunger: 1
  },
  {
    cheeseName: 'Gruyere',
    cheeseDeliciousness: 2,
    contestantName: 'Carol C',
    contestantHunger: 6
  }
]

const contest1 = new Contest()
contest1.registerContestants(rawDataArray)
contest1.runContest(3)
contest1.reportResults()