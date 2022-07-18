class Pool {
  constructor(width, len = null) {
    if (len == null) {
      this.width = width;
      this.len = width;
    } else {
      this.width = width;
      this.len = len;
    }
  }
  area() {
    return this.len * this.width;
  }
  volume() {
    return this.area() * 5;
  }
}

export default Pool;
