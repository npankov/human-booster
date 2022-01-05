let tabNotes = [15, 17, 8, 4, 20, 18, 6.5];

let nbNotesSousMoyenne = 0;

//Pour chaque note du tableau
for (let i = 0; i < tabNotes.length; i++) {
    const noteCourante = tabNotes[i];
    //La note "courante" est-elle inférieure à la moyenne
    if (noteCourante < 10) {
        nbNotesSousMoyenne = nbNotesSousMoyenne + 1;
        //Ou encore nbNotesSousMoyenne++
    }
}

console.log("Il y a " + nbNotesSousMoyenne + " notes sous la moyenne");