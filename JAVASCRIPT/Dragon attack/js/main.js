'use strict';

let game = {
    round: 1
};


let DIV = document.querySelector('#game');

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
    switch (game.difficulte) {
        case 1:
            game.hitDragon = getRandomInteger(10, 20);
            break;
        case 2:
            game.hitDragon = getRandomInteger(20, 30);
            break;
        case 3:
            game.hitDragon = getRandomInteger(20, 30);
            break;
        default:
            break;
    }

    let leftHPKnight = game.hpKnight - Math.round(game.hitDragon * game.armorRatio);
    game.hpKnight = leftHPKnight;
    console.log(`Le dragon inflige ${leftHPKnight} points de dommage au chevalier`);
};

function computePlayerDamagePoint() {
    switch (game.difficulte) {
        case 1:
            game.hitKnight = getRandomInteger(25, 30);
            break;
        case 2:
            game.hitKnight = getRandomInteger(15, 20);
            break;
        case 3:
            game.hitKnight = getRandomInteger(5, 10);
            break;
        default:
            break;
    }

    let leftHPDragon = game.hpDragon - Math.round(game.hitKnight * game.swordRatio);
    game.hpDragon = leftHPDragon;
    console.log(`Le dragon inflige ${leftHPDragon} points de dommage au dragon`);
};

function resultBattle() {
    if (game.hpDragon < 0) {
        console.log('Le Chevalier est gagné!')
    } else if (game.hpKnight < 0) {
        console.log('Le Dragon est gagné!')
    }
}

function gameLoop() {
    let knightSpeed , dragonSpeed;
    while (game.hpDragon > 0 && game.hpKnight > 0) {    
        knightSpeed = Math.random();
        dragonSpeed = Math.random();

        if (knightSpeed > dragonSpeed) {
            computePlayerDamagePoint();
        } else {
            computeDragonDamagePoint();
        }

        game.round += 1;
        console.log('HP Dragon', game.hpDragon)
        console.log('HP Chevalier', game.hpKnight)
    }

    resultBattle()
}



function startGame() {
    initializeGame();
    gameLoop();
}

startGame()
