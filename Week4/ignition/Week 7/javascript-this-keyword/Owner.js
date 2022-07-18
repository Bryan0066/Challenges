class Owner {
  constructor(name, role) {
    this.name = name
    this.role = role
    this.pets = []
  }

  addPet(pet) {
    debugger
    this.pets.push(pet)
  }
}

module.exports = Owner
