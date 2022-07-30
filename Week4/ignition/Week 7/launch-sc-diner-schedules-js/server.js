class Server {
  constructor(name) {
    this.name = name;
    this.shifts = [];
  }
  assignShift(shift) {
    this.shifts.push(shift);
    shift.filled = true;
  }
  available(shift) {
    let isAvailable = true;
    this.shifts.forEach((currentShifts) => {
      if (
        shift.startTime >= currentShifts.endTime ||
        shift.endTime <= currentShifts.startTime
      ) {
      } else isAvailable = false;
    });
    return isAvailable;
  }
}

export default Server;
