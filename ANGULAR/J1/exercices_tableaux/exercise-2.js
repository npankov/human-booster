function exsTwo() {
  const names = ['Pierre', 'Marie', 'Jan', 'Paul'];
  const newNames = names.map((name) =>name === 'Jan' ? 'Jean' : name);
  console.log(newNames)
}

// function exsTwo() {
//   const names = ['Pierre', 'Marie', 'Jan', 'Paul'];
//   let result = [];
//   for (let name of names) {
//     if (name === 'Jan') {
//       result.push('Jean');
//     } else {
//       result.push(name);
//     }
//   }
//   console.log(result);
// }

exsTwo();