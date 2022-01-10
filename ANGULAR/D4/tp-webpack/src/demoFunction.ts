export function getLink() {
    let link: string = 'https://geo.api.gouv.fr/communes?codePostal=';
    const index: string = (document.querySelector('#index') as HTMLInputElement).value;
    console.log(link + index)
    return link + index;
}

