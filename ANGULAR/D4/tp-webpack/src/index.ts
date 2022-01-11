import { getLink } from "./demoFunction";

const form = document.querySelector('form');
const result = document.querySelector('#result') as HTMLParagraphElement;

form?.addEventListener('submit', (e) => {
  e.preventDefault();
  const link = getLink();
  fetch(link)
    .then((response) => {
      return response.json()
    })
    .then((data) => data.map((el: any) => result.innerHTML = `Ville: ${el.nom} / Code region: ${el.codeRegion} / Population: ${el.population} personnes`));
})