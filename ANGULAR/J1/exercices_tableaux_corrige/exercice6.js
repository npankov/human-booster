let tabFilms = [
    "Bienvenue à Gattaca",
    "Matrix",
    "Matrix reloaded",
    "Matrix revolution",
    "Matrix 4",
    "Stalingrad",
    "OSS 117 Le caire, nid d'espions"
];

let matrixTrouve = false;
let i = 0;

while(i < tabFilms.length && !matrixTrouve) {
    matrixTrouve = tabFilms[i] === "Matrix 4";
    i++;
}

//2 cas de sortie de boucle : j'ai trouvé matrix, ou non
if (matrixTrouve) {
    console.log("Film trouvé en position " + (i - 1));
} else {
    console.log("Film absent du tableau");
}