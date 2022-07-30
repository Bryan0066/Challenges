class Menu {
  constructor(title, startTime, endTime) {
    this.title = title;
    this.startTime = startTime;
    this.endTime = endTime;
    this.meals = [];
  }
  addMeal(meal) {
    this.meals.push(meal);
  }
  printMenu() {
    console.log(`Menu: ${this.title}`);
    this.meals.forEach((meal) => {
      console.log(meal.name);
    });
  }

  static whichMenu(hour) {
    if (hour < 12) {
      return `Breakfast Menu`;
    }
    if (hour > 12 && hour < 16) {
      return `Lunch Menu`;
    }
    if (hour > 16) {
      return `Dinner Menu`;
    }
  }
}

export default Menu;
