import Pool from "./Pool.js";

console.log(new Pool(12, 10));
console.log(new Pool(4, 6));
console.log(new Pool(10, 15));

console.log(new Pool(12, 10));
console.log(new Pool(8, 6));
console.log(new Pool(5));
console.log(new Pool(9));
/*
const pool = new Pool(10, 15)
console.log(pool.area())
const anotherPool = new Pool(5)
console.log(anotherPool.area())
*/
const pool = new Pool(10, 15);
console.log(pool.volume());
const anotherPool = new Pool(5);
console.log(anotherPool.volume());
