'use strict';

let game = {
    round: 1
};

let DIV = document.querySelector('#game');
let divImage = document.querySelector('#image');

function initializeGame() {
    game.difficulte = requestInteger(
        'Choisir le neveau : \n1 - Facile, 2 - Moyenne, 3 - Difficile', 
        1, 3
    )

    switch (game.difficulte) {
        case 1:
            game.hpKnight = getRandomInteger(200, 250);
            game.hpDragon = getRandomInteger(150, 200);
            break;
        case 2:
            game.hpKnight = getRandomInteger(200, 250);
            game.hpDragon = getRandomInteger(200, 250);
            break;
        case 3:
            game.hpKnight = getRandomInteger(150, 200);
            game.hpDragon = getRandomInteger(200, 250);
            break;

        default:
            break;
    }

    game.sword = requestInteger(
        'Choisir l\'epee : \n1 - Bois, 2 - Fer, 3 - Excalibur', 
        1, 3
    )

    switch (game.sword) {
        case 1:
            game.swordRatio = 0.5;
            break;
        case 2:
            game.swordRatio = 1;
            break;
        case 3:
            game.swordRatio = 1.5;
            break;
    
        default:
            break;
    }

    game.armor = requestInteger(
        'Choisir l\'armure : \n1 - Cuivre, 2 - Acier, 3 - Magique', 
        1, 3
    )

    switch (game.armor) {
        case 1:
            game.armorRatio = 1;
            break;
        case 2:
            game.armorRatio = 0.75;
            break;
        case 3:
            game.armorRatio = 0.5;
            break;
    
        default:
            break;
    }

};

function computeDragonDamagePoint() {
    let damage;
    if (game.difficulte === 1) {
        damage = getRandomInteger(10, 20);
    } else {
        damage = getRandomInteger(20, 30);
    } 
    return Math.round(damage * game.armorRatio);
    // switch (game.difficulte) {
    //     case 1:
    //         game.hitDragon = getRandomInteger(10, 20);
    //         break;
    //     case 2:
    //         game.hitDragon = getRandomInteger(20, 30);
    //         break;
    //     case 3:
    //         game.hitDragon = getRandomInteger(20, 30);
    //         break;
    //     default:
    //         break;
    // }

    // game.leftHPKnight = game.hpKnight - Math.round(game.hitDragon * game.armorRatio);
    // game.dammageDragon = game.hpKnight - game.leftHPKnight;
    // game.hpKnight = game.leftHPKnight;
    // console.log(`Le dragon inflige ${game.leftHPKnight} points de dommage au chevalier`);
};

function computePlayerDamagePoint() {
    let damage;
    switch (game.difficulte) {
        case 1:
            damage = getRandomInteger(25, 30);
            break;
        case 2:
            damage = getRandomInteger(15, 20);
            break;
        case 3:
            damage = getRandomInteger(5, 10);
            break;
        default:
            break;
    }
    return Math.round(damage * game.swordRatio);
    // game.leftHPDragon = game.hpDragon - Math.round(game.hitKnight * game.swordRatio);
    // game.dammageKnight = game.hpDragon - game.leftHPDragon;
    // game.hpDragon = game.leftHPDragon;
    // console.log(`Le dragon inflige ${game.leftHPDragon} points de dommage au dragon`);
};

function resultBattle() {
    if (game.hpDragon < 0) {
        divImage.innerHTML += `
        <article>
            <img src="./img/knight.png" alt="">
            <span class="bold">Vous avez gagné !!!</span>
            <span>Il vous restait ${game.hpKnight} PV</span>
        </article>
        <br>
        `;
    } else if (game.hpKnight < 0) {
        divImage.innerHTML += `
        <article>
            <img src="./img/dragon.png" alt="">
            <span class="bold">Le dragon a gagné, vous avez été carbonisé :(</span>
            <span>Il restait ${game.hpDragon} PV au Dragon</span>
        </article>
        <br>
        `;
    }
}

function renderTour() {
    DIV.innerHTML += `
    <span class="bold">Personnage PV</span>
    <table>
        <tr>
            <td>Chevalier</td>
            <td>${game.hpKnight}</td>
        </tr>
        <tr>
            <td>Dragon</td>
            <td>${game.hpDragon}</td>
        </tr>
    </table>
    <br>
    `
}

function renderTitle() {
    DIV.innerHTML += `<div class="bold">Points de vie de depart</div><br>`;
}

function renderNumberRound() {
    DIV.innerHTML += `<div class="bold">----- Tour n°${game.round} -----</div><br>`;
}

function renderDescriptionDragon(damage) {
    DIV.innerHTML += `<div>Le dragon est plus rapide  et vous brulé, il vous enleve ${damage} PV</div><br>`
}

function renderDescriptionKnight(damage) {
    DIV.innerHTML += `<div>Vous etes plus rapide et frappez le dragon, vous lui enleve ${damage} PV</div><br>`
}

function gameLoop() {
    let knightSpeed, dragonSpeed, damage;
    renderTitle()
    renderTour();
    
    while (game.hpDragon > 0 && game.hpKnight > 0) { 
        renderNumberRound()

        knightSpeed = Math.random();
        dragonSpeed = Math.random();
        if (knightSpeed > dragonSpeed) {
            damage = computePlayerDamagePoint();
            game.hpDragon -= damage;
            renderDescriptionKnight(damage);
        } else {
            damage = computeDragonDamagePoint();
            game.hpKnight -= damage;
            renderDescriptionDragon(damage);
        }
        renderTour();
        game.round += 1;
    }
    resultBattle();
}

function startGame() {
    initializeGame();
    gameLoop();
}

startGame()
