function allCaps(string) {
  return string.toUpperCase();
}

function combine(arg1, arg2) {
  return arg1 + " " + arg2;
}

reverseString = (str) => {};

function reduceString(string, no_of_occur) {
  let string = string.split("");
  let new_array = [];

  string = string.map((char) => {
    let i = no_of_occur;

    if (i > 0) {
      new_array.push(char);
    }
  });
  console.log(new_array);
}
