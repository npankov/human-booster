'use strict';

let state = {};
const images = [
    {
        image: './images/1.jpg',
        legend: 'Freres pandas'
    },
    {
        image: './images/2.jpg',
        legend: 'Yoga on the top'
    }
]

document.addEventListener('DOMContentLoaded', function() {

    document.querySelector('#toolbar-toggle').addEventListener('click', function() {
        document.querySelector('.toolbar ul').classList.toggle('hide');
        document.querySelector('#slider img').src = `${images[0].image}`;
        document.querySelector('#slider figcaption').innerHTML = images[0].legend;
    })
})