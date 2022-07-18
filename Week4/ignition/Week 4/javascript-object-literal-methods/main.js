// your code here
const book = {
    title: "Furiously Happy: A Funny Book About Horrible Things",
    author: "Jenny Lawson",
    yearPublished: "2015",
    timesCheckedOut: 0,
    isCheckedOut: false,
    updateBookStatus() {
        if (this.isCheckedOut === false) {
          this.timesCheckedOut += 1
        }
        this.isCheckedOut = !this.isCheckedOut
        console.log("Book status updated to " + this.isCheckedOut)
      }
  }



console.log(book)