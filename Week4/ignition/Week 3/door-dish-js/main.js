
alert(`It's working so far!`)

/* Part 1
//Greet the patron.
alert(`Hello hungry person.`)
//Ask if their order is for takeout or delivery.
let orderType = prompt(`For takeout or delivery?`)
//Accept the user's answer and save it as a variable.
while (!orderType){
    orderType = prompt(`Please enter "takeout" or "delivery".`)
}
//Ask how many pizzas they would like.
numPizza = prompt(`How many pizzas do you want?`)
//Accept the user's answer and save it as a variable.
while (!numPizza){
    orderType = prompt(`Please enter "takeout" or "delivery".`)
}
//Ask if they would like extra cheese added as a topping.
xCheese = prompt(`Would you like extra cheese? (input nothing if no)`)
if (!xCheese){
    xCheese = ``

} else {
    xCheese = `with extra cheese`
}
//Output a sentence returning the number pizzas, if there's extra cheese, and if it's delivery or takeout.
alert(`Your order: ${numPizza} pizza(s) ${xCheese}, for ${orderType}`)
*/


/* Part 2

const pizza = 15.0
const extraCheese = 2.0
const deliveryFee = 3.0
let driverTip = 0.0

alert(`Hello hungry person.`)
let orderType = prompt(`For takeout or delivery?`)
while (!orderType){
    orderType = prompt(`Please enter "takeout" or "delivery".`)
}
if (orderType.toLowerCase == 'delivery') {
    driverTip = prompt (`How much would you like to tip?`)
}
numPizza = prompt(`How many pizzas do you want?`)
while (!numPizza){
    orderType = prompt(`Please enter "takeout" or "delivery".`)
}
xCheese = prompt(`Would you like extra cheese? (input nothing if no)`)
if (!xCheese){
    xCheese = ``
} else {
    xCheese = `with extra cheese`
}
alert(`Your order: ${numPizza} pizza(s) ${xCheese}, for ${orderType}.\n Thanks for tipping `)

/*Update your code to prompt the user how much of a tip they want to give 
the driver only after they've selected delivery as their option.
 The user input should update the current value stored in driverTip.
*/


// Part 3


const pizza = 15.0
const extraCheese = 2.0
const deliveryFee = 3.0
let driverTip = 0.0
let deliveryTotal = 0.0

alert(`Hello hungry person.`)
let orderType = prompt(`For takeout or delivery?`)
while (!orderType){
    orderType = prompt(`Please enter "takeout" or "delivery".`)
}

//takeout works fine but delivery gives a weird total
if (orderType.includes(`delivery`)) {
    driverTip = prompt (`How much would you like to tip?`)
    driverTip = parseInt(driverTip)
    deliveryTotal = driverTip + deliveryFee
}

numPizza = prompt(`How many pizzas do you want?`)
pizzaCost = numPizza * pizza

xCheese = prompt(`Would you like extra cheese? (input nothing if no)`)

if (!xCheese){
    xCheese = ``
    cheeseCost = 0
} else {
    xCheese = `with extra cheese`
    cheeseCost = numPizza * extraCheese
    alert(`That will be $${cheeseCost} extra`)
}


total = cheeseCost + deliveryTotal + pizzaCost
/*console.log(` extra cheese ${cheeseCost}`)
console.log(` driver tip ${driverTip}`)
console.log(`deliveryFee ${deliveryFee}`)
console.log(`pizzaCost ${pizzaCost}`)
*/

alert(`Your order: ${numPizza} pizza(s) ${xCheese}, for ${orderType}.\n With a $${driverTip} tip and a delivery fee (if applicable), your total is $${total}`)




// Part 4