'use strict';

const tauxTva = 20;
const DIV = document.querySelector("#content");
const montantHt = parseFloat(window.prompt("Quel est le montant hors taxes ?"), 5);
const siReduction = window.prompt("Choisir le remise : oui / non");
let montantAvecRemise = 0;
let purcenteReduction = 0;

if (siReduction === 'oui') {
  const purcenteReduction = parseFloat(window.prompt('Choisir le purcent de reduction'), 5);
  montantAvecRemise = montantHt - montantHt / 100 * purcenteReduction;
  const calculDeTva = montantAvecRemise / 100 * tauxTva;
  const montantTtc = montantAvecRemise + calculDeTva;
  
  DIV.innerHTML += `<p>Pour un montant de ${montantAvecRemise} € il y a ${calculDeTva} € de TVA.</p>`;
  DIV.innerHTML += `<p>Le montant TTC est donc de ${montantTtc} €.</p>`;
  DIV.innerHTML += `<p>Le montant de remise est ${purcenteReduction} €.</p>`;
} else if (siReduction === 'non') {
  const calculDeTva = montantHt / 100 * tauxTva;
  const montantTtc = montantHt + calculDeTva;

  DIV.innerHTML += `<p>Pour un montant de ${montantHt} € il y a ${calculDeTva} € de TVA.</p>`;
  DIV.innerHTML += `<p>Le montant TTC est donc de ${montantTtc} €.</p>`;
  DIV.innerHTML += `<p>Le remise n'ete pas apliqué</p>`;
}







