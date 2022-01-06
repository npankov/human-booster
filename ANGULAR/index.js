const inputA = document.querySelector('#input1');
const inputB = document.querySelector('#input2');
const button = document.querySelector('button');
const div = document.querySelector('#content');

function calculate() {
  return Number(inputA.value) + Number(inputB.value);
}

button.addEventListener('click', () => {
    div.innerHTML += `<div>Le résultat est ${calculate()} </div>`;
});

