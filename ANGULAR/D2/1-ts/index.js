var numberA = document.getElementById('input1').valueAsNumber;
var numberB = document.getElementById('input2').valueAsNumber;
var form = document.querySelector('form');
var div = document.querySelector('#content');
function calculate(numberA, numberB) {
    return numberA + numberB;
}
form.addEventListener('submit', function (e) {
    e.preventDefault();
    var result = calculate(numberA, numberB);
    console.log(numberA, numberB);
    console.log(result);
    div.innerHTML += "<div>Le r\u00E9sultat est ".concat(result, " </div>");
});
