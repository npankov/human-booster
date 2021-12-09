const liElements = document.querySelectorAll('li');
const selectAll = document.querySelector('#selectAll');
const deselectAll = document.querySelector('#deselectAll');
const DIV = document.querySelector('#total em').textContent;

function hoverClick() {
    this.classList.toggle('selected');
    counterPhotos()
}

function selectAllPotos() {
    liElements.forEach((li) => li.classList.add('selected'));
    counterPhotos()
}

function deselectAllPotos() {
    liElements.forEach((li) => li.classList.remove('selected'));
    counterPhotos()
}

function counterPhotos() {
   const numberPhotos = document.querySelectorAll('.selected');
   document.querySelector('#total em').textContent = numberPhotos.length;
}

liElements.forEach((li) => li.addEventListener('click', hoverClick));
selectAll.addEventListener('click', selectAllPotos);
deselectAll.addEventListener('click', deselectAllPotos);


