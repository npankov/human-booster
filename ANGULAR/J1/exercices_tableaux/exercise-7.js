function exsSeven() {
  const numbers = [2, 5, 8, 9, 78, 16, 5, 8, 2, 10, 2];
  let objNumbers = {};

  numbers.forEach((number) => {
    objNumbers[number] = (objNumbers[number] || 0) + 1;
  })

  for (let number in objNumbers) {
    console.log('Le numero', number, 'est inclus dans le tableau', objNumbers[number], 'fois');
  }
}

exsSeven();