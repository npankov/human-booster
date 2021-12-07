'use strict';

let date = new Date();
let options = {
    weekday: 'long',
    day: 'numeric',
    month: 'long',
    year: 'numeric'
}

const div = document.querySelector('#content');
div.innerHTML += `<p>Nous sommes le ${date.toLocaleString('fr-FR', options)}</p>`;