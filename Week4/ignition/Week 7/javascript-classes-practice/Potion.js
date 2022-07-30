class Potion {
  constructor(type, magnitude) {
    this.type = type;
    this.magnitude = magnitude;
    this.name = type + magnitude;
  }
}

export default Potion;
