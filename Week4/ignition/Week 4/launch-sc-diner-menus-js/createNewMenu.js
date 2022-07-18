const createNewMenu = (title, startTime, endTime) => {
  const menu = {
    title: title,
    meals: [],
    startTime: startTime,
    endTime: endTime,

    addMeal: (meal) => {
      menu.meals.push(meal);
    },

    printMenu: () => {
      console.log(`\n${menu.title}\n`);
      menu.meals.forEach((element) => {
        console.log(element.ingredients);
      });
    },
    
  };
  return menu;
};

export default createNewMenu;
