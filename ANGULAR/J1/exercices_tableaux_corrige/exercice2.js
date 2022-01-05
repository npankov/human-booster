let tabPrenoms = ["Pierre", "Marie", "Jan", "Paul"];

//On retrouve la position de "Jan" (ici 2)
let positionJan = tabPrenoms.indexOf("Jan");

//Méthode 1 : on accède directement à la case de notre tableau
tabPrenoms[positionJan] = "Jean";

//Méthode 2 : on utilise fill pour remplir notre tableau, à partir d'un indice donné jusqu'à un autre
tabPrenoms.fill("Jean", positionJan, positionJan + 1);

//Méthode 3 : on utilise splice pour supprimer "Jan" et insérer "Jean" à la place
//Le chiffre 1 indique que l'on supprime un seul élément à partir de la position positionJan
tabPrenoms.splice(positionJan, 1, "Jean");

console.log(tabPrenoms);