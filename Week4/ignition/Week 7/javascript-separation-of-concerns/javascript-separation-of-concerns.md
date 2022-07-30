As we've discussed while building our object classes, _classes_ and _objects_ are meant to represent an object (either physical or conceptual) in the real world. Let's dive a little deeper into the related design principle of the **_Separation of Concerns_**.

## Separating our Concerns

The concept of **_separating concerns_** is a fundamental design principle of Object-Oriented Programming. In short, this principle guides us to organize our code into reusable and modular pieces. When we build out our classes, we want to make sure each class is only responsible for one _concern_: for storing state and behavior related to one specific section, feature, or even concept, of our application. By separating all of the vast logic of our application into different pieces, our code becomes a lot more straightforward to navigate, understand, and update.

Crucial to the idea of _Separation of Concerns_ is minimizing the overlap in functionality among different sections of your code. Instead of duplicating code in multiple places, it is better to extract out the functionality of that code and then reference it in multiple places. While the Separation of Concerns can be implemented in many ways with many different tools (classes, functions, packages, etc.), we will focus here on classes, as that is one of the primary ways we are beginning to organize our code.

A code snippet is worth a thousand words, so let's look at some code! Let's say we're building an application that keeps track of grade-school students and courses. We'll start by building out a `Student` class to store the information we need to keep track of.

```javascript
class Student {
  constructor(firstName, lastName, course, period, teacher) {
    this.firstName = firstName
    this.lastName = lastName
    this.grades = []
    this.course = course
    this.period = period
    this.teacher = teacher
  }

  assignGrade(grade) {
    this.grades.push(grade)
  }
}

const augustus = new Student('Augustus', 'Waters', 'Math', 1, 'Mr. Labor')
const hazel = new Student('Hazel Grace', 'Lancaster', 'Biology', 3, 'Ms. Tasio')
const isaac = new Student('Isaac', 'Thomas', 'Biology', 5, 'Ms. Tasio')
```

We have a `Student` class that takes in `firstName`, `lastName`, `course`, `period`, and `teacher`, and then stores all of those attributes, as well as an empty `grades` array, as instance variables. We also have a method called `assignGrade` which adds a grade to the `grades` array. However, we can see that the student objects are now responsible for storing information that doesn't _just_ relate to the student: `course`, `period`, and `teacher` don't have anything to do with who the student is as a person! For Hazel and Isaac, we can even see that their course and teacher are the same, but the period is different, so we're beginning to replicate some of the same information in two different objects. And what if a student is in multiple courses throughout the day?! We want a way to keep our course and student information separate.

At this point, we see that our `Student` class is dealing with multiple different concerns: some related to the student themself but others related the student's courses. Let's try extracting some of that information out into a `Course` class.

```javascript
class Student {
  constructor(firstName, lastName) {
    this.firstName = firstName
    this.lastName = lastName
    this.grades = []
  }

  assignGrade(grade) {
    this.grades.push(grade)
  }
}

class Course {
  constructor(name, period, teacher) {
    this.name = name
    this.period = period
    this.teacher = teacher
    this.students = []
  }

  enroll(student) {
    this.students.push(student)
  }
}
```

We now have our initial `Student` class storing the information for a student (their name and grades) and behavior so that we can update that information, and we also have a `Course` class that stores the information for each course (the name of the course, period the course is scheduled for, name of the teacher, and list of students), along with a way to update the student list. We can instantiate a few students and courses to try it out:

```javascript
const augustus = new Student('Augustus', 'Waters')
const hazel = new Student('Hazel Grace', 'Lancaster')
const isaac = new Student('Isaac', 'Thomas')

const mathPeriod1 = new Course('Math', 1, 'Mr. Labor')
const bioPeriod3 = new Course('Biology', 3, 'Ms. Tasio')
const bioPeriod5 = new Course('Biology', 5, 'Ms. Tasio')

mathPeriod1.enroll(augustus)
bioPeriod3.enroll(hazel)
bioPeriod5.enroll(isaac)
bioPeriod5.enroll(augustus)

console.log(mathPeriod1.students)
// [ Student { firstName: 'Augustus', lastName: 'Waters', grades: [] } ]

console.log(bioPeriod3.students)
// [ Student { firstName: 'Hazel Grace', lastName: 'Lancaster', grades: [] } ]

console.log(bioPeriod5.students)
// [ Student { firstName: 'Isaac', lastName: 'Thomas', grades: [] },
//   Student { firstName: 'Augustus', lastName: 'Waters', grades: [] } ]
```

Our code can now easily represent that Augustus is in both first-period Math with Mr. Labor and fifth-period Biology with Ms. Tasio (and Isaac!).

But look carefully. Is there another concern that we might want to separate out?

What about the fact that Ms. Tasio is listed as teaching Biology for two different periods? While the teacher herself is certainly _coupled_ to the idea of a course, the teacher exists separate from the course and teaches multiple different periods of Bio -- and who knows, next year she may even take up an Earth Science class. How could we better organize our code to minimize duplication and increase flexibility?

Enter our `Teacher` class:

```javascript
class Student {
  constructor(firstName, lastName) {
    // ...
}

class Course {
  constructor(name, period) {
    this.name = name
    this.period = period
    this.students = []
  }

  enroll(student) {
    this.students.push(student)
  }
}

class Teacher {
  constructor(name, classroom) {
    this.name = name
    this.classroom = classroom
    this.courses = []
  }

  schedule(course) {
    this.courses.push(course)
  }
}
```

Now, we have a `Course` class which stores the `name`, `period`, and list of `students` and our separate `Teacher` class to show that a teacher exists, as a human, separate from the courses they teach. Our `Teacher` stores the `name` and `classroom` of the teacher and allows us to `schedule()` new courses into their `courses` list.

Again, we can instantiate some objects in order to see it in action:

```javascript
const augustus = new Student('Augustus', 'Waters')
const hazel = new Student('Hazel Grace', 'Lancaster')
const isaac = new Student('Isaac', 'Thomas')

const mrLabor = new Teacher('Mr. Labor', 214)
const msTasio = new Teacher('Ms. Tasio', 324)

const mathPeriod1 = new Course('Math', 1)
const bioPeriod3 = new Course('Biology', 3)
const bioPeriod5 = new Course('Biology', 5)

mrLabor.schedule(mathPeriod1)
msTasio.schedule(bioPeriod3)
msTasio.schedule(bioPeriod5)

mathPeriod1.enroll(augustus)
bioPeriod3.enroll(hazel)
bioPeriod5.enroll(isaac)
bioPeriod5.enroll(augustus)

console.log(mrLabor.courses)
// [ Course {
//    name: 'Math',
//    period: 1,
//    students:
//     [ Student { firstName: 'Augustus', lastName: 'Waters', grades: [] } ] } ]

console.log(msTasio.courses)
// [ Course {
//    name: 'Biology',
//    period: 3,
//    students:
//     [ Student { firstName: 'Hazel Grace', lastName: 'Lancaster', grades: [] } ] },
//  Course {
//    name: 'Biology',
//    period: 5,
//    students:
//     [ Student { firstName: 'Isaac', lastName: 'Thomas', grades: [] },
//       Student { firstName: 'Augustus', lastName: 'Waters', grades: [] } ] } ]
```

We have properly **_separated our concerns_** into 3 separate classes: one for our students, one for the courses, and one for our teachers. We have _coupled_ them together using our empty arrays and methods in order to tie a teacher to the courses they teach and the students to the courses they take.

### Why is it important?

The idea of separating our concerns is an incredibly important and valuable design principle for making scalable and maintanable software applications. The benefits of having well-organized, modular, and reusable code really begin to shine as our application and our team grow in size.

Let's look at a real-world business example. Let's say I'm making an application that stores different recipes. We want to scale the app for wider use, and hire a new developer to add a fancy shopping-list functionality so that users can make a list of their recipes for the week and populate a shopping list quickly and easily.

Luckily, when building this app, I made separate JavaScript classes for not just each `Recipe`, but also for each `Ingredient`. I was also careful to separate out the logic into different sections for each functionality: signing up, marking recipes as favorites, and creating a list of recipes for the week.

Thanks to the separate implementation of my `Ingredient` class, the new developer can easily pull a list of all ingredients into a grocery list for the week. They also don't need to worry about fully understanding the entire application in order to avoid accidentally breaking other functionality - because I organized the `Ingredient`s so well, it's obvious what part of the code they need to become familiar with to build the new grocery list section.

But imagine if I _hadn't_ implemented a separation of concerns in my code? What if I had just made the whole `Recipe` class take in one `details` parameter? Worse yet, what if I didn't even use classes but just stored each recipe as one long string somewhere in my code? What hoops would this poor new developer have to jump through to figure out what part of that string was the ingredients they're looking for? Or (\*gasp!\*) what if I just put all of my code for the entire application into one disorganized file? That new developer would have had to dig through and understand thousands and thousands of lines to build that one new feature, and any small changes could have effects they don't even realize due to messy code. A little bit of organization up-front made my code modular and reusable for new features in the future.

> **_An important note:_ sometimes this "new developer" is actually "you of the future!" Our brains can be surprisingly bad at remembering exactly what we were thinking when building an application a year ago. Separating your concerns won't just help your teammates; it will also help you down the road!**

### Summary

- The Separation of Concerns is a design principle that we adhere to in order to build well-organized, maintanable, and scalable code
- We separate our concerns to create organized, concise, DRY, and reusable sections of code
- JavaScript classes are a great way to separate our concerns: they allow us to separate out the state and behavior for one particular object or concept
- We want to make sure each class represents one and only one object or concept within our code
