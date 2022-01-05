function exsSix() {
  const films = ['Harry Potter', 'Blow', 'Matrix 4', 'Matrix 1'];

  for (let i = 0; i < films.length; i += 1) {
    if (films[i] === 'Matrix 4') {
      console.log(i + 1);
    }
  }
}

exsSix();