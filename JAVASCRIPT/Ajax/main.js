'use strict';

let btn, div;

function ajaxCallHtml(path) {
    fetch(path)
    .then((response) => response.text())
    .then((data) => div.innerHTML = data)
    .catch((error) => alert("Erreur : " + error));
}

function ajaxCallJson(path) {
    fetch(path)
    .then((response) => response.json())
    .then((data) => {
        let html = '<ul>'
        data.forEach((el) => (html += `<li><b>Prenom</b> : ${el.firstName}</li> <br> <li><i>Telephone : ${el.phone}</i></li><br>`));
        html += '</ul>';
        div.innerHTML = html;
    })
    .catch((error) => alert("Erreur : " + error));
}

function ajaxCallJsonHtml(path) {
    fetch(path)
    .then((response) => response.json())
    .then((data) => {
        let html = '<ul class="movie-list">';
        data.forEach((el) => (html += `<li><img src="images/${el.cover}"><p>
        <strong>${el.title}</strong> -
        <em>${el.duration}</em>
        </p></li>`));
        html += '</ul>';
        div.innerHTML = html;
    })
    .catch((error) => alert("Erreur : " + error));
}

function getValue() {
    let choice = document.querySelector('input[name="what"]:checked').value;
    switch (choice) {
        case '1':
            ajaxCallHtml('http://127.0.0.1:5500/Ajax/data/1-get-html-article.html');
            break;

        case '2':
            ajaxCallJson('http://127.0.0.1:5500/Ajax/data/2-get-contacts-list.json');
            break;

        case '3':
            ajaxCallHtml('http://127.0.0.1:5500/Ajax/data/3-get-html-movies.html');
            break;

        case '4':
            ajaxCallJsonHtml('http://127.0.0.1:5500/Ajax/data/4-get-json-movies.json');
            break;
    
        default:
            break;
    }
}

document.addEventListener('DOMContentLoaded', function() {
    btn = document.querySelector('#run');
    div = document.querySelector('#target');
    btn.addEventListener('click', getValue);
})