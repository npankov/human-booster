'use strict';

  const tauxTva = 20;
  const montantHt = parseFloat(window.prompt("Quel est le montant hors taxes ?"), 5);
  const calculDeTva = montantHt / 100 * tauxTva;
  const montantTtc = montantHt + calculDeTva;
  
  const DIV = document.querySelector("#content");
  DIV.innerHTML += `<p>Pour un montant de ${montantHt} € il y a ${calculDeTva} € de TVA.</p>`;
  DIV.innerHTML += `<p>Le montant TTC est donc de ${montantTtc} €.</p>`;
