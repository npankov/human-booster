'use strict';

// Pankov Nikolai

// *****
// VARIABLES
// *****

//array names of Heros
const namesHeros = [
    'Aragorn',
    'Boromir',
    'Frodon',
    'Gandalf',
    'Gimli',
    'Legolas',
    'Merry',
    'Pipin',
    'Sam'
];

let select, ulTeam, liElements, selectAllElements;

// *****
// FUNCTIONS
// *****

function loadNames() {
    //loading all names of heros in the select element
    for (let name of namesHeros) {
        select.innerHTML += `<option value="${name}">${name}</option>`;
    }
}

function renderImages() {
    //make all names in our array names to lowercase
    let namesHerosLower = namesHeros.map((name) => name.toLowerCase());
    //rendering all photos
    namesHerosLower.forEach((name) => ulTeam.innerHTML += `<li><img src="img/${name}.jpeg" alt="${name}"></li>`)
}

function getName() {
    //get name selected and make to lower case
    const name = document.querySelector('#member').value.toLowerCase();
    return name;
}

function searchAndSelectImage() {
    //get name selected
    const name = getName();
    let imageSelected;
    //compare name with "alt" of the image
    for (let img of liElements) {
        if (img.alt === name) {
            imageSelected = img;
            //add class selected what image is selected
            img.classList.add('selected');
        } else {
            //remove class selected what image is changed
            img.classList.remove('selected');
        }
    }
}

// *****
// EVENTS
// *****

document.addEventListener('DOMContentLoaded', function () {
    select = document.querySelector('#member');
    ulTeam = document.querySelector('#team');
    loadNames();
    renderImages();
    liElements = document.querySelectorAll('#team li img');
    selectAllElements = document.querySelectorAll('#member option');
    document.querySelector('input').addEventListener('click', searchAndSelectImage);
});