const rectangle = document.querySelector('.rectangle');
const button = document.querySelector('#toggle-rectangle');

function hideCube() {
    rectangle.classList.toggle('hide');
}

function changeColor() {
    rectangle.classList.add('important');
}

function removeColor() {
    rectangle.classList.remove('important');
    rectangle.classList.remove('good');
}

function clickColorWhite() {
    rectangle.classList.add('good');
}

button.addEventListener('click', hideCube);
rectangle.addEventListener('mouseenter', changeColor);
rectangle.addEventListener('mouseleave', removeColor);
rectangle.addEventListener('click', clickColorWhite);