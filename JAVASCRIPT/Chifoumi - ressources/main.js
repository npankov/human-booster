'use strict';

let userReponse;
let aiReponse;
const DIV = document.querySelector('#content');

do {
    userReponse = window.prompt('Votus voules choisir pierre / feuille  / ciseau', 'pierre').toLowerCase(); 
}
while (userReponse !== 'pierre' && userReponse !== 'ciseau' && userReponse !== 'feuille');

aiReponse = Math.random();

if (aiReponse < 1/3) {
    aiReponse = 'pierre';
} else if (aiReponse < 2/3) {
    aiReponse = 'feuille';
} else {
    aiReponse = 'ciseau'
}

const imagesReponses = `
                        <figure>
                            <img src="img/${userReponse}.png" alt="">
                            <figcaption>Vous</figcaption>
                        </figure>
                        <figure>
                            <img src="img/${aiReponse}.png" alt="">
                            <figcaption>AI</figcaption>
                        </figure>`

if (userReponse === aiReponse) {
    DIV.innerHTML += imagesReponses;
    DIV.innerHTML += `<div>L'ordinateur font le même choix on obtient une égalité</div>`;
} else {
    switch (aiReponse) {
        case 'pierre':
            if (userReponse === 'feuille') {
                DIV.innerHTML += imagesReponses;
                DIV.innerHTML += `<div>La pierre est enveloppée par la feuille. Vous gagné</div>`;
            } else {
                DIV.innerHTML += imagesReponses;
                DIV.innerHTML += `<div>Le ciseau est écrasé par la pierre. Vous perdé</div>`;
            }  
        break;

        case 'ciseau':
            if (userReponse === 'feuille') {
                DIV.innerHTML += imagesReponses;
                DIV.innerHTML += `<div>La feuille est découpée par le ciseau. Vous perdé</div>`;
            } else {
                DIV.innerHTML += imagesReponses;
                DIV.innerHTML += `<div>Le ciseau est écrasé par la pierre. Vous gagné</div>`;
            }  
        break;

        case 'feuille':
            if (userReponse === 'ciseau') {
                DIV.innerHTML += imagesReponses;
                DIV.innerHTML += `<div>La feuille est découpée par le ciseau. Vous gagné</div>`;
            } else {
                DIV.innerHTML += imagesReponses;
                DIV.innerHTML += `<div>La pierre est enveloppée par la feuille. Vous perdé</div>`;
            }  
        break;
    
        default:
            break;
    }
}



// let userReponse;
// let aiReponse;

// do {
//     userReponse = window.prompt('Votus voules choisir pierre / feuille  / ciseau', 'pierre').toLowerCase(); 
// }
// while (userReponse != 'pierre' && 'ciseau' && 'feuille');

// const DIV = document.querySelector('#content');
// switch (userReponse.toLowerCase()) {
//     case 'pierre':
//         DIV.innerHTML += `<div><img src="img/pierre.png" alt=""><figcaption>Vous</figcaption></div>`;
//     break;

//     case 'feuille':
//         DIV.innerHTML += `<div><img src="img/feuille.png" alt=""><figcaption>Vous</figcaption></div>`;
//     break;

//     case 'ciseau':
//         DIV.innerHTML += `<div><img src="img/ciseau.png" alt=""><figcaption>Vous</figcaption></div>`;
//     break;

//     default:
//         DIV.innerHTML = `<span>Wrong Reponse</span>`;
//         break;
// }

// const maxCount = 3;
// aiReponse = Math.floor(Math.random() * maxCount);
// console.log(aiReponse);

// switch (aiReponse) {
//     //pierre
//     case 0:
//         DIV.innerHTML += `<div><img src="img/pierre.png" alt=""><figcaption>Ordinateur</figcaption></div>`;
//         break;

//      //feuille
//      case 1:
//         DIV.innerHTML += `<div><img src="img/feuille.png" alt=""><figcaption>Ordinateur</figcaption></div>`;
//         break;

//     //ciseau
//     case 2:
//         DIV.innerHTML += `<div><img src="img/ciseau.png" alt=""><figcaption>Ordinateur</figcaption></div>`;
//         break;

//     default:
        
//         break;
// }

// if (userReponse === 'pierre' && aiReponse === 1) {
//     DIV.innerHTML += `<span>La pierre est enveloppée par la feuille. Vous perdez</span>`;
// } else if (userReponse === 'pierre' && aiReponse === 2) {
//     DIV.innerHTML += `<span>Le ciseau est écrasé par la pierre. Vous gagné</span>`;
// } else if (userReponse === 'pierre' && aiReponse === 0) {
//     DIV.innerHTML += `<span>L'ordinateur font le même choix on obtient une égalité</span>`;
// }

// if (userReponse === 'feuille' && aiReponse === 1) {
//     DIV.innerHTML += `<div><span>La pierre est enveloppée par la feuille. Vouz gagné</span>`;
// } else if (userReponse === 'feuille' && aiReponse === 2) {
//     DIV.innerHTML += `<div><span>La feuille est découpée par le ciseau. Vous perdé</span>`;
// } else if (userReponse === 'feuille' && aiReponse === 0) {
//     DIV.innerHTML += `<div><span>La pierre est enveloppée par la feuille. Vous gagné</span>`;
// }

// if (userReponse() === 'ciseau' && aiReponse === 1) {
//     DIV.innerHTML += `<div><span>La feuille est découpée par le ciseau . Vous gagné</span>`;
// } else if (userReponse === 'ciseau' && aiReponse === 2) {
//     DIV.innerHTML += `<div><span>L'ordinateur font le même choix on obtient une égalité</span>`;
// } else if (userReponse === 'ciseau' && aiReponse === 0) {
//     DIV.innerHTML += `<div><span>Le ciseau est écrasé par la pierre. Vous perdez</span>`;
// }