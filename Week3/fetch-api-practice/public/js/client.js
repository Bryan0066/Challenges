const fetchBooks = async () => {
  try {
    const response = await fetch("/api/v1/books");
    if (!response.ok) {
      const errorMessage = `${response.status} (${response.statusText})`;
      const error = new Error(errorMessage);
      throw error;
    }
    const responseBody = await response.json();
    console.log("responseBody:", responseBody);
    return responseBody;
  } catch (err) {
    console.error("Error in fetch!");
    console.error(err);
  }
};

const addBooksToPage = async () => {
  const books = await fetchBooks();

  books['books'].forEach((book) => {
    let newBook = document.createElement('li')
    newBook.innerHTML = book["name"]
    document.getElementById("books").appendChild(newBook)
    
  });
};

addBooksToPage();
