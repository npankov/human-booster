'use strict';

let voiture = {
    marque: 'porshe',
    model: '911',
    puissance: 3000,
    miseCirculation: '01/01/2021',
    prix: 128.500,
    passagers: [
        'Nikolai',
        'Julia',
        'Guillaume'
    ]
};

const valuesVoiture = Object.entries(voiture); 
const DIV = document.querySelector('#content');

DIV.innerHTML += `<ul>Information sur la voiture</ul>`;
for (let i of valuesVoiture) {
    DIV.innerHTML += `<li>${i[0]} : ${i[1]}</li>`;
}