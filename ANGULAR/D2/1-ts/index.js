var form = document.querySelector('form');
var div = document.querySelector('#content');
function calculate(numberA, numberB) {
    return numberA + numberB;
}
function renderResult(result) {
    div.insertAdjacentHTML('beforeend', "<div>Le r\u00E9sultat est ".concat(result, " </div>"));
}
form.addEventListener('submit', function (e) {
    e.preventDefault();
    var numberA = document.getElementById('input1').valueAsNumber;
    var numberB = document.getElementById('input2').valueAsNumber;
    var result = calculate(numberA, numberB);
    console.log(result);
    renderResult(result);
});
