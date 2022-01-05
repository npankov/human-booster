let tabNombres = [432, 65, 45, 432, 2, 8, 2, 2, 2, 15, 65];

//1. Je construis un tableau qui contient chaque nombre (sans doublons)
let tabSansDoublons = [];

for (const nombre of tabNombres) {
    if (!tabSansDoublons.includes(nombre)) {
        tabSansDoublons.push(nombre);
    }
}

//2. Je boucle sur ce tableau, pour déclencher une recherche d'occurence pour chaque nombre
for (const nombre of tabSansDoublons) {

    //3. Je recherche le nombre d'occurrences du nombre courant
    let nombreOccurrences = 0;
    for (const nombreParcours of tabNombres) {
        if (nombreParcours === nombre) {
            nombreOccurrences++;
        }
    }
    console.log("Il y a " + nombreOccurrences + " occurrence(s) du nombre " + nombre);
}