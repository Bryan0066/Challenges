//Part 1
vegan = document.getElementsByTagName("li");
vegan[0].textContent = "Oat Milk";

//Part 2
fruits = ["Apples", "Bananas", "Kiwis"];
foodStoreList = document.getElementById("grocery-list");

for (let index = 0; index < fruits.length; index++) {
  const element = fruits[index];
  const newli = document.createElement("li");
  const newContent = document.createTextNode(element);
  newli.appendChild(newContent);
  const currentli = document.getElementById("li");
  foodStoreList.insertBefore(newli, currentli);
}

//Part 3

let newdiv = document.createElement("div");
newdiv.id = "pantry-section";
document.body.appendChild(newdiv);
let newDivHeader = document.createElement("h1");
newDivHeader.textContent = "Pantry Section:";
newdiv.appendChild(newDivHeader);

//Part 4
let pantryItems = ["Potatoes","Carrots", "Tomatos"]
let pantrySection = document.getElementById("pantry-section")
const pantryUl = document.createElement("ul")
pantryUl.id = 'pantryUl'
pantrySection.appendChild(pantryUl)

for (let index = 0; index < pantryItems.length; index++) {
    const element = pantryItems[index];
    pantryUl.innerHTML += `<li>${element}</li>`
  }

//Part 5

let lastPantryItem = pantryUl.lastChild
foodStoreList.appendChild(lastPantryItem)

//Part 6

let notes = document.createElement("div")
notes.id = "notes-section"
document.body.appendChild(notes)
let notesH1 = document.createElement("h1")
notesH1.textContent = "Notes"
notes.appendChild(notesH1)

//Part 7

let paragraphNotes = document.createElement("p")
paragraphNotes.id = paragraphNotes
paragraphNotes.innerHTML = `<p> Meals this week: Baked potatoes, Mashed potatoes \n -Potato stew </p>`
notes.appendChild(paragraphNotes)
let favRecipe = document.createElement("a")

favRecipe.innerHTML = `<a href="https://www.recipetineats.com/beef-stroganoff/">Beef Stroganoff, my fav</a>`
notes.appendChild(favRecipe)