"use strict";
let listProducts = [];
let inputToDelete, btnDeleteAllProducts, btnDelete, popUp, listElements;

function addProduct(product) {
  listProducts.push(product);
}

function findAndRemoveProduct(product) {
    let index = listProducts.indexOf(product);
    if (index != -1) {
      listProducts.splice(index, 1);
      return true;
    } else {
      alert("Ce produit ne figure pas dans la liste !");
      return false;
    }
}

function deleteOne(item) {
    if (findAndRemoveProduct(item)) {
        togglePopUp();
    }
}

function deleteAllProducts() {
  listProducts = [];
  displayList();
}

function displayList() {
  listElements.innerHTML = "";
  listProducts.forEach((el) => (listElements.innerHTML += `<li>${el}</li>`));
  document.querySelector(
    "section h2"
  ).innerHTML = `Il y a ${listProducts.length} elements`;
}

function getValue(selector, fnCallback) {
  const item = document.querySelector(selector).value;
  fnCallback(item);
  displayList();
}

function togglePopUp() {
  popUp.classList.toggle("hide");
}

document.addEventListener("DOMContentLoaded", function () {
  inputToDelete = document.querySelector("#toDelete");
  btnDeleteAllProducts = document.querySelector("#delete");
  btnDelete = document.querySelector("#btnDelete");
  popUp = document.querySelector("#popup");
  listElements = document.querySelector(".list");

  document.querySelector("#submit").addEventListener("click", function() {
      getValue('#toAdd', addProduct);
  });

  document.querySelector("#deleteOne").addEventListener("click", togglePopUp);

  btnDelete.addEventListener("click", function () {
    getValue("#toDelete", deleteOne)
  });

  document.querySelector("span").addEventListener("click", togglePopUp);

  btnDeleteAllProducts.addEventListener("click", deleteAllProducts);
});
