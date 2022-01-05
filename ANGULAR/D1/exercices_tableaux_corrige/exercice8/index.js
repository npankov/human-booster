
//1. Demande de nombres
let nombresSaisis = [];
let nombreDeNombresDemandes = 5;

for(let i = 0; i < nombreDeNombresDemandes; i++) {
    let nouveauNombre = prompt("Merci de saisir un nombre : ");
    nombresSaisis.push(nouveauNombre);
}

//2. Affichage 
let liste = document.createElement("ul");

for (const nombre of nombresSaisis) {
    let element = document.createElement("li");
    element.innerText = nombre;
    liste.append(element);
}

document.body.append(liste);