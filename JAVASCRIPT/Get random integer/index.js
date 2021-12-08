'use strict';

function getRandomInteger(min, max) {
    return Math.floor(Math.random() * (max - min + 1) + min);
}

export function requestInteger(msg, min, max) {
    let integer;

    do {
        integer = Number(window.prompt('Saisir un nombre compris entre 1 et 3'));    
    } while (isNan(integer) || integer < min || integer > max);

    return integer;
}

requestInteger()