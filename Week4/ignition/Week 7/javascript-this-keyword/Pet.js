class Pet {
  constructor(name, species, sound, favoriteSnack) {
    this.name = name
    this.species = species
    this.sound = sound
    this.favoriteSnack = favoriteSnack
  }

  praise() {
    debugger
    return `${this.name}, what a good ${this.species}!`
  }
}

module.exports = Pet
