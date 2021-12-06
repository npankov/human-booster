'use strict'

function tva() {
  const aNumber = Number(window.prompt("Quel est le montant hors taxes ?"));
  const calculDeTva = aNumber / 100 * 20;
  const result = aNumber + calculDeTva;
  
  const DIV = document.querySelector("#content");
  DIV.innerHTML += `<p>Pour un montant de 100 € il y a ${calculDeTva} € de TVA.</p>`;
  DIV.innerHTML += `<p>Le montant TTC est donc de ${result} €.</p>`;
}

tva();