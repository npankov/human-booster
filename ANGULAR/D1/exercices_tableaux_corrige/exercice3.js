let nombres = [10, 12, 5, 6, 124, 85, 5];

let min = nombres[0];
let max = nombres[0];

for(let i=1; i<nombres.length; i++){
    let nombreCourant = nombres[i];

    if (nombreCourant > max) {
        max = nombreCourant;
    }

    if (nombreCourant < min) {
        min = nombreCourant;
    }
}

console.log("Le nombre le plus grand du tableau est " + max);
console.log("Le nombre le plus petit du tableau est " + min);