isPrime = (number) => {
  // program to check if a number is prime or not

  // take input from the user
  let isPrime = true;

  // check if number is equal to 1
  if (number === 1) {
    console.log("1 is neither prime nor composite number.");
  }

  // check if number is greater than 1
  else if (number > 1) {
    // looping through 2 to number-1
    for (let i = 2; i < number; i++) {
      if (number % i == 0) {
        isPrime = false;
        break;
      }
    }

    if (isPrime) {
      console.log(`${number} is a prime number`);
    } else {
      console.log(`${number} is a not prime number`);
    }

    return isPrime;
  }

  // check if number is less than 1
  else {
    console.log("The number is not a prime number.");
  }
};

arraySum = (array) => {
  let x = 0;

  array.forEach((element) => {
    x += element;
  });

  return x;
};

fizzBuzz = (num) => {
  if (Number.isInteger(num)) {
    if (num % 3 == 0 && num % 5 == 0) {
      return "fizzbuzz";
    }
    if (num % 3 == 0) {
      return "fizz";
    }
    if (num % 5 == 0) {
      return "buzz";
    }
    return num;
  }
  return null;
};
