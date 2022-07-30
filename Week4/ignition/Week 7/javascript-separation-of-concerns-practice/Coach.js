class Coach {
    constructor (name, firstYear) {
        this.name = name
        this.firstYear = firstYear
        this.stats = {
            wins: 0,
            losses: 0,
            draws: 0,
            matchesPlayed: 0
          }
    }
    gameOver (outcome) {
        if (outcome.toLowerCase() == "w") {
            console.log("thats a win")
            this.stats['wins'] += 1
        }
        if (outcome.toLowerCase() == "l") {
            console.log("ya lost")
            this.stats['losses'] += 1
        }
        if (outcome.toLowerCase() == "d") {
            console.log('ya picasso')
            this.stats['draws'] += 1
        }
        this.stats["matchesPlayed"] += 1
    }
    printSummary (){
        console.log(`${this.name} stats:`)
        console.log(`${this.stats.wins}`)
        console.log(`${this.stats.losses}`)
        console.log(`${this.stats.draws}`)
        console.log(`${this.stats.matchesPlayed}\n`)
    }
}

export default Coach