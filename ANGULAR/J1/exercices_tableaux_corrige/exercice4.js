let chaine = "Bonjour Jean Dupont";

//Méthode 1 : 
let positionPremierEspace = chaine.indexOf(" ");
let positionDernierEspace = chaine.lastIndexOf(" ");

let prenom = chaine.slice(positionPremierEspace + 1, positionDernierEspace);
let nom = chaine.slice(positionDernierEspace + 1);

console.log(prenom);
console.log(nom);

//Méthode 2 :
let chaineSeparee = chaine.split(" ");
let prenom2 = chaineSeparee[1];
let nom2 = chaineSeparee[2];

console.log(prenom);
console.log(nom);