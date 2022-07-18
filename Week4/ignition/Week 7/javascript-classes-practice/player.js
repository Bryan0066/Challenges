class Player {
  constructor() {
    this.health = 100;
    this.stamina = 70;
    this.inventory = [];
    this.statusEffects = {};
  }
  useHealthPotion() {
    if (this.inventory.includes("Health+25")) {
      this.health += 25;
      this.inventory.splice("Health+25");
    } else {
      console.log("No Health potion in inventory!");
    }
  }
  addToInventory(item) {
    this.inventory.push(item);
  }
}

export default Player;
