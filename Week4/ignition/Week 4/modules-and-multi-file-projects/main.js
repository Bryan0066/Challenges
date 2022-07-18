// main.js
import sayPopPop from "./sayPopPop.js"
import sayMyNameIsAlex from "./sayMyNameIsAlex.js"
import createNewStudent from "./createNewStudent.js"

sayPopPop()
sayPopPop()

sayMyNameIsAlex()

const annie = createNewStudent("Annie", "Edison", "Spanish 101")
const jeff = createNewStudent("Jeff", "Winger", "Intro to Pottery")

annie.greet()
jeff.greet()