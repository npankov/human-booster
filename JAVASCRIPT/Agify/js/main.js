'use strict';

// https://api.agify.io?name=michael API

let firstName;

function getLinkName() {
    fetch(`https://api.agify.io?name=${firstName}`)
      .then((response) => response.json())
      .then((data) => console.log(data))
}

document.addEventListener('DOMContentLoaded', function() {
    firstName = document.querySelector('#firstname').value;
    console.log(firstName)
})