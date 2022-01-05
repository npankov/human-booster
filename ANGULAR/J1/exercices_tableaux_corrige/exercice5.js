let tabHabitantsPays = [
    65000000, /* France */
    83155031, /* Allemagne */
    8932664, /* Autriche */
    6916548, /* Bulgarie */
    47394223 /* Espagne */
];

let totalNombreHabitants = 0;
let nombrePaysTresPeuples = 0;

for (const populationPays of tabHabitantsPays) {
    totalNombreHabitants+= populationPays;
    if (populationPays > 10000000) {
        nombrePaysTresPeuples++;
    }
}

console.log("Nombre d'habitants total : " + totalNombreHabitants);
console.log("Nombre d'habitants en moyenne : " + totalNombreHabitants / tabHabitantsPays.length);
console.log("Nombre de pays très peuplés (plus de 10M d'habitants) : " + nombrePaysTresPeuples);