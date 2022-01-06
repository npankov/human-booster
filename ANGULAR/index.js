const numberA = document.querySelector('#input1').valueAsNumber;
const numberB = document.querySelector('#input2').valueAsNumber;
const button = document.querySelector('#input3');
const form = document.querySelector('form');
const div = document.querySelector('#content');

function calculate(numberA, numberB) {
  return numberA + numberB;
}

form.addEventListener('submit', (e) => {
  e.preventDefault();
  const result = calculate(numberA, numberB);
  console.log(result);
  div.innerHTML += `<div>Le résultat est ${result} </div>`;
});
