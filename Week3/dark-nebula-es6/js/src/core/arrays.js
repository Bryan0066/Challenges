function append(array, x) {
  array.push(x);
  return array;
}

function truncate(array, x) {
  array.pop(x);
  return array;
}

function prepend(array, x) {
  array.unshift(x);
  return array;
}

function curtail(array, x) {
  array.shift(x);
  return array;
}

function concat(array1, array2) {
  return array1.concat(array2);
}

function insert(array, value, index) {
  array.splice(index, 0, value);
  return array;
}

function count(array, value) {
  repeats_array = [];

  array.forEach((element) => {
    if (element == value) {
      repeats_array.push(element);
    }
  });

  return repeats_array.length;
}

function duplicates(array) {
  repeats_array = [];

  array.forEach((element1) => {
    let occurences = 0;
    array.forEach((element2) => {
      if (element2 == element1) {
        occurences += 1;
        if (occurences == 2) {
          repeats_array.push(element2);
        }
      }
    });
  });

  let uniqueChars = [];
  repeats_array.forEach((c) => {
    if (!uniqueChars.includes(c)) {
      uniqueChars.push(c);
    }
  });

  return uniqueChars;
}

function square(array) {
  return array.map((element) => element * element);
}

findAllOccurrences = (arr, item) => {};
