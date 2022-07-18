class Team {
  constructor(name) {
    this.name = name;
    this.coach = null;
    this.players = [];
  }

  signPlayer(player) {
    this.players.push(player);
  }
  hireCoach(coach) {
    this.coach = coach;
  }
  printSummary() {
    console.log(`${this.coach.name} is the head coach for ${this.name}.`);
    this.coach.printSummary();
    console.log("Players:");
    this.players.forEach((player) => {
      console.log(`Name: ${player.name}`);
      console.log(`Number: ${player.number}`);
      console.log(`Position: ${player.position}`);
      console.log(`Stats:`);
      console.log(`Goals: ${player.stats.goals}`);
      console.log(`Assists: ${player.stats.assists}`);
      console.log(`Ejections: ${player.stats.ejections}\n`);
    });
  }
}

export default Team;
