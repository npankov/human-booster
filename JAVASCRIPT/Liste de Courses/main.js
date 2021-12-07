'use strict';

let products = [];

function addProducts (name) {
    products.push(name);
};

function deleteProduct (nom) {
    for (let i = 0; i < products.length; i +=1) {
        if (products[i] == nom) {
            products.splice(i, 1);
        }
    }
};

function deleteAllProducts () {
    // products = [];
    // products.length = 0;
    products.splice(0, products.length);
}

function info () {
    let inf = products.length;
    for (let i = 0; i < products.length; i +=1) {
        console.log(i, ':', products[i]);
    }
    console.log(`La liste contient ${inf} produits`)
}