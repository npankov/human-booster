'use strict';

function requestInteger(msg, min, max) {
    let integer;

    do {
        integer = parseFloat(window.prompt(msg)); 
        console.log(integer)  
    } while (isNaN(integer) || integer < min || integer > max);
    return integer;
}

function getRandomInteger(min, max) {
    return Math.floor(Math.random() * (max - min + 1) + min);
}


