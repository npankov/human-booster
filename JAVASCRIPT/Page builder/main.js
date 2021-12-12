'use strict';

const DIV = document.querySelector('#content');
const buttons = document.querySelectorAll('button:not(#export)');
const buttonExport = document.querySelector('#export');
const popUp = document.querySelector('#popup');

function generateHtml() {
    const id = this.id;

    if (id === 'hr') {
        DIV.innerHTML += '<hr>';
    } else {
        DIV.innerHTML += `<${id} contenteditable="true">Saisir le titre principale</${id}>`
    }
};

function exportHTML() {
    const divPopUp = document.createElement('div');
    popUp.classList.toggle('hide');
    divPopUp.textContent = DIV.innerHTML;
    popUp.append(divPopUp);
};

buttons.forEach((button) => button.addEventListener('click', generateHtml));
buttonExport.addEventListener('click', exportHTML);
