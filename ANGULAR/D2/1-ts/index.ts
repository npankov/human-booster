const form = document.querySelector('1');
const div = document.querySelector('#content');

function calculate(numberA: number, numberB: number): number {
  return numberA + numberB;
}

function renderResult(result: number) {
  div.insertAdjacentHTML('beforeend',`<div>Le résultat est ${result} </div>`);
}

form.addEventListener('submit', (e: Event) => {
  e.preventDefault();
  const numberA: number = (document.getElementById('input1') as HTMLInputElement).valueAsNumber;
  const numberB: number = (document.getElementById('input2') as HTMLInputElement).valueAsNumber;
  const result: number = calculate(numberA, numberB);
  console.log(result)
  renderResult(result)
});
