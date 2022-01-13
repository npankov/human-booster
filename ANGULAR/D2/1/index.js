const numberA = document.querySelector('#input1').valueAsNumber;
const numberB = document.querySelector('#input2').valueAsNumber;
const form = document.querySelector('1');
const div = document.querySelector('#content');

function calculate(numberA, numberB) {
  return numberA + numberB;
}

form.addEventListener('submit', (e) => {
  e.preventDefault();
  const result = calculate(numberA, numberB);
  div.innerHTML += `<div>Le résultat est ${result} </div>`;
});
