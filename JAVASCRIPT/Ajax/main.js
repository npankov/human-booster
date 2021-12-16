'use strict';

function ajaxCall(path, fnCallback, type = 'text') {
    fetch(path)
    .then((response) => (type == 'text' ? response.text() : response.json()))
    .then((data) => fnCallback(data))
    .catch((error) => alert("Erreur : " + error));
}

function insertHTML(html) {
    document.querySelector('#target').innerHTML = html;
}

function contactsRender(data) {
    let html = '<ul>'
    data.forEach((el) => (html += `<li><b>Prenom</b> : ${el.firstName}</li> <br> <li><i>Telephone : ${el.phone}</i></li><br>`));
    html += '</ul>';
    insertHTML(html);
}

function movieRender(data) {
    let html = '<ul class="movie-list">';
    data.forEach((el) => (html += `<li><img src="images/${el.cover}"><p>
    <strong>${el.title}</strong> -
    <em>${el.duration}</em>
    </p></li>`));
    html += '</ul>';
    insertHTML(html);
}

function getValue() {
    let choice = document.querySelector('input[name="what"]:checked').value;
    switch (choice) {
        case '1':
            ajaxCall('http://127.0.0.1:5500/Ajax/data/1-get-html-article.html', insertHTML);
            break;

        case '2':
            ajaxCall('http://127.0.0.1:5500/Ajax/data/2-get-contacts-list.json', contactsRender, 'json');
            break;

        case '3':
            ajaxCall('http://127.0.0.1:5500/Ajax/data/3-get-html-movies.html', insertHTML);
            break;

        case '4':
            ajaxCall('http://127.0.0.1:5500/Ajax/data/4-get-json-movies.json', movieRender, 'json');
            break;
    
        default:
            break;
    }
}

document.addEventListener('DOMContentLoaded', function() {
    document.querySelector('#run').addEventListener('click', getValue);
})