// Exceeds expectation file
const tvShows = ["Community", "The Office", "Bojack Horseman", "Buffy the Vampire Slayer"]
const movies = ["Lord of the Rings", "The Dark Knight", "Forrest Gump", "The Godfather"]

//console.log('At least this works ._.')

/*
//Part 1:
addMotionPicture = () => {
    choice= ""
    while (choice.lower != 'tv show' || choice.lower != movie) {

        console.log('Hello! Would you like to add a Tv show or movie? ')
    choice = prompt('Hello! Would you like to add a Tv show or movie? ')

    if (choice == "tv show"){
        name = prompt('What is the title of the Tv Show?')
        tvShows.push(name)
        break
    }
    if (choice == "movie") {
        name = prompt('What is the title of the Movie?')
        movies.push(name)
        break
    }
    else {
        prompt("I don't understand that input")
        console.log("I don't understand that input")
    }
}}

addMotionPicture()

console.log(tvShows)
console.log(movies)

// Part 2.

favoriteTVShow = () => {
    console.log(`The favorite TV show is ${tvShows[0]}`)
}


// Part 3.
//I tried a -1 index here but it didnt work?
favoriteMovie = () => {
    x = movies.length - 1
    console.log(`The least favorite movie is ${movies[x]}`)
}

favoriteTVShow()
favoriteMovie()

// Part 4.

favshow = prompt('What favorite show do you want to add to the top of the list?')

addFavoriteTVShow = (name) => {
    tvShows.unshift(name)
}

addFavoriteTVShow(favshow)
console.log(tvShows)



// Part 5

favmovie = prompt('What favorite movie do you want to add to the top of the list?')

addFavoriteMovie = (name) => {
    movies.unshift(name)
}

addFavoriteMovie(favmovie)
console.log(movies)



// Part 6

verifyTVShow = (name) => {
    if (tvShows.includes(name)) {
        console.log(`${name} is already in the list.`)
    } else {
        console.log(`${name} is not yet in the list of TV Shows.`)
    }
}

verifyTVShow("Futurama")



// Part 7

verifyMovie = (name) => {
    if (movies.includes(name)) {
        console.log(`${name} is already in the list.`)
    } else {
        console.log(`${
            
            
            name} is not yet in the list of Movies.`)
    }
}

verifyMovie("The Dark Knight")

*/


//Forgot to add the last part that logs the confirmation to the console

// Part 8 (exceeds expectations part 1)
const allMotionPictures = () => {
    rank = 1
    console.log('Favorite TV Shows:')
    tvShows.forEach(element => {
            console.log(`${rank}: ${element}`)
            rank += 1
    })

    rank = 1
    console.log("---------")
    console.log('Favorite Movies:')

    movies.forEach(element => {
            console.log(`${rank}: ${element}`)
            rank += 1
    })
}

allMotionPictures()


// EE Part 2



addRankedMotionPicture = (type, rank, name) => {
    if (rank >= tvShows.length){
        // handles an input thats out of the range of the list, puts it at the end
        rank = tvShows.length}
    else{
        // A "normal" person using this wont know that 0 = 1, this solves it.
        rank -= 1
    }
    if (type == 'TV Show') {
    tvShows.splice(rank, 0, name)
    console.log(`The ${type} ${name} was added with a rank of ${rank+1}`)
    } if (type == "Movie") {
    movies.splice(rank, 0, name)
    console.log(`The ${type} ${name} was added with a rank of ${rank+1}`)
    }
}

addRankedMotionPicture('Movie', 3, 'ya mum')

