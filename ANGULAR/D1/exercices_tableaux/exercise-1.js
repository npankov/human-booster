function exsFirst() {
  let marks = [1, 2, 3, 4];
  let result = 0;

  const sum = marks.reduce((a, b) => a + b);
  const averageMark = sum / marks.length;
  for (let mark of marks) {
    if (mark < averageMark) {
      result += 1;
    }
  }
  console.log(result);
}

exsFirst();