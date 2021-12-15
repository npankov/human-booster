const liElements = $('li');
const selectAll = $('#selectAll');
const deselectAll = $('#deselectAll');
const DIV = $('#total em');

function hoverClick() {
    $(this).toggleClass('selected');
    counterPhotos();
}

function selectAllPhotos() {
    liElements.addClass('selected');
    counterPhotos();
}

function deselectAllPhotos() {
    liElements.removeClass('selected');
    counterPhotos();
}

function counterPhotos() {
   const numberPhotos = $('.selected');
   if (numberPhotos.length === 0) {
       DIV.css('color', 'red');
   } else {
       DIV.css('color', 'yellow');
   }
   DIV.text(numberPhotos.length);
}

liElements.on('click', hoverClick);
selectAll.on('click', selectAllPhotos);
deselectAll.on('click', deselectAllPhotos);


