function exsFour() {
  const names = 'Bonjour Jean Dupont';
  const namesArr = names.split(' ');
  const firstName = namesArr.filter((name) => name === 'Jean').toString();
  const lastName = namesArr.filter((name) => name === 'Dupont').toString();
  console.log(firstName, lastName)
}

exsFour();