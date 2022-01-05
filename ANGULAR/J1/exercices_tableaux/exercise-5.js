function exsFive() {
  const quantityCitizens = [
   60000000, //france
   50000000, //germany
   300000000, //spain
   200000000, //italy
   500000000, //cuba
   10000000, //belarus
   150000000, //russia
   300000000, //usa
   2000000000, //china
   1000000000 //india
 ];
  let result = 0;
  const quantityTotal = quantityCitizens.reduce((a, b) => a + b);
  const quantityAverage = quantityTotal / quantityCitizens.length;

  for (let citizens of quantityCitizens) {
    if (citizens > 10000000) {
      result += 1;
    }
  }

  console.log('Le nombre d’habitants total =', quantityTotal);
  console.log('Le nombre d’habitants moyenne =', quantityAverage);
  console.log('Le nombre de pays pour lesquels il y a plus de 10 millions d’habitants =', result);
}

exsFive();