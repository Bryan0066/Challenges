//I entered 'et submit' twice by accident, love it


import Player from "./Player.js";
import Team from "./Team.js";
import Coach from "./Coach.js";

const drogba = new Player("Didier Drogba", 11, "Striker", "Chelsea", "Frank Lampard");
const alonso = new Player("Marcos Alonso", 3, "Left back", "Chelsea", "Frank Lampard");
const messi = new Player("Lionel Messi", 10, "Forward", "Barcelona", "Quique Setién");
const ronaldo = new Player("Cristiano Ronaldo", 7, "Forward", "Juventus", "Maurizio Sarri");

drogba.score();
drogba.score();
drogba.assist();
alonso.score();
messi.assist();
messi.score();
ronaldo.assist();
ronaldo.redCard();

console.log("Drogba's stats:");
console.log(drogba.stats);
console.log("Alonso's stats:");
console.log(alonso.stats);
console.log("Messi's stats:");
console.log(messi.stats);
console.log("Ronaldo's stats:");
console.log(ronaldo.stats);

const frankLampard = new Coach("Frank Lampard", 2019);
const quique = new Coach("Quique Setién", 2020);
const maurizio = new Coach("Maurizio Sarri", 2019);

const chelsea = new Team("Chelsea");
const barcelona = new Team("Barcelona");
const juventus = new Team("Juventus");

chelsea.hireCoach(frankLampard);
barcelona.hireCoach(quique);
juventus.hireCoach(maurizio);

chelsea.signPlayer(messi);
chelsea.signPlayer(ronaldo);
chelsea.signPlayer(drogba);
chelsea.signPlayer(alonso);

frankLampard.gameOver("W")
frankLampard.gameOver("L")
frankLampard.gameOver("D")

console.log(chelsea.printSummary());
