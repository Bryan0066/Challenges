// Will come back and clean up nested if statements, too convoluted 


let addressBook = {
  "Mark Zuckerberg": "markymark@example.com",
  "Grace Hopper": "foundABug@example.com",
  "Alan Turing": "alanTheMachine@example.com",
  "Sister Mary Kenneth Keller": "theOGDoctor@example.com",
  "Ada Lovelace": "kindaCalledThisWholeComputerThing@example.com",
  "Bill Gates": "noBlueScreens@example.com",

  addressBookChecker() {
    while (true) {
    let x = prompt('Who do you wish to contact? (Type "exit" to exit)')
    if (x in addressBook){
      console.log(addressBook[x]) 
    } else {
       if(x.toLowerCase() == 'exit') {
        break
      } else {
        answer = prompt("I dont recognize that input, would you like to add a new contact?")
        if (answer.toLowerCase() == "yes"){
          addressBook[x] = prompt("What is their email?")
        } else {}
      }
    }
  }
}}
addressBook.addressBookChecker()