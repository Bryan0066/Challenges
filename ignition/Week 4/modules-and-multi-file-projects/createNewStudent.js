// createNewStudent.js

const createNewStudent = (firstName, lastName, favoriteClass) => {
  const student = {
    firstName,
    lastName,
    favoriteClass,
    greet() {
      console.log(
        `${this.firstName} ${this.lastName} loves ${this.favoriteClass}`
      );
    },
  };

  return student;
};

export default createNewStudent;
