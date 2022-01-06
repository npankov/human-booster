const numberA: number = (document.getElementById('input1') as HTMLInputElement).valueAsNumber;
const numberB: number = (document.getElementById('input2') as HTMLInputElement).valueAsNumber;
const form = document.querySelector('form');
const div = document.querySelector('#content');

function calculate(numberA: number, numberB: number): number {
  return numberA + numberB;
}

form.addEventListener('submit', (e: Event) => {
  e.preventDefault();
  const result: number = calculate(numberA, numberB);
  console.log(result)
  div.innerHTML += `<div>Le résultat est ${result} </div>`;
});
