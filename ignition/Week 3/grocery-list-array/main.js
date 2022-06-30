//your code here

//Creates an array to represent your shopping list with the following items: 'pop tarts', 'ramen noodles', 'chips', 'salsa', and 'coffee'

let shoppingList = ['pop tarts', 'ramen noodles', 'chips', 'salsa', 'coffee']

//Adds 'fruit loops' to the list.
shoppingList.push('fruit loops')
console.log(shoppingList)

//Updates 'coffee' to 'fair trade coffee'
coffee = shoppingList.indexOf('coffee')
shoppingList[coffee] = 'fair trade coffee'
console.log(shoppingList)

//Replaces 'chips' and 'salsa' with 'rice' and 'beans'
chips = shoppingList.indexOf('chips')
salsa = shoppingList.indexOf('salsa')
shoppingList[chips] = 'rice'
shoppingList[salsa] = 'beans'
console.log(shoppingList)

//Create an empty array to represent your shopping cart.
shoppingCart = []

//Removes the last item from your shopping list and add it to your cart
lastItem = shoppingList.pop()
shoppingCart.push(lastItem)
console.log(shoppingList)
console.log(shoppingCart)

//Removes the first item from your shopping list and add it to the cart
firstItem = shoppingList.shift()
shoppingCart.push(firstItem)
console.log(shoppingList)
console.log(shoppingCart)

//Writes a 'while' loop that takes items from your shopping list and moves them to your cart until there are no items left on the list.
while (shoppingList.length != 0){
    shoppingList.forEach(element => {
        transferItem = shoppingList.shift(element)
        shoppingCart.push(transferItem)
})};

console.log(shoppingList)
console.log(shoppingCart)

//Prints the list of items in your shopping cart to the console as a comma separated string.

console.log(shoppingCart.toString())