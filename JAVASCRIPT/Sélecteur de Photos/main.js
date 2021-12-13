const liElements = document.querySelectorAll('li');
const selectAll = document.querySelector('#selectAll');
const deselectAll = document.querySelector('#deselectAll');
const DIV = document.querySelector('#total em');

function hoverClick() {
    this.classList.toggle('selected');
    counterPhotos()
}

function selectAllPhotos() {
    liElements.forEach((li) => li.classList.add('selected'));
    counterPhotos()
}

function deselectAllPhotos() {
    liElements.forEach((li) => li.classList.remove('selected'));
    counterPhotos()
}

function counterPhotos() {
   const numberPhotos = document.querySelectorAll('.selected');
   if (numberPhotos.length === 0) {
       DIV.style.color = 'red';
   } else {
       DIV.style.color = 'yellow';
   }
   DIV.textContent = numberPhotos.length;
}

liElements.forEach((li) => li.addEventListener('click', hoverClick));
selectAll.addEventListener('click', selectAllPhotos);
deselectAll.addEventListener('click', deselectAllPhotos);


