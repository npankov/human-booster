"use strict";
let listProducts = [];
let inputToDelete, btnDeleteAllProducts, btnDelete, popUp, listElements;

function addProduct(product) {
  listProducts.push(product);
}

function findAndRemoveProduct(product) {
  product = inputToDelete.value;
  let index = listProducts.indexOf(product);

  if (index != -1) {
    listProducts.splice(index, 1);
  } else {
    alert("Ce product ne figure pas dans la liste");
  }
  displayList();
  hidePopUp();
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

function getValue() {
  const item = document.querySelector("#toAdd").value;
  addProduct(item);
  displayList();
}

function hidePopUp() {
  popUp.classList.add("hide");
}

document.addEventListener("DOMContentLoaded", function () {
  inputToDelete = document.querySelector("#toDelete");
  btnDeleteAllProducts = document.querySelector("#delete");
  btnDelete = document.querySelector("#btnDelete");
  popUp = document.querySelector("#popup");
  listElements = document.querySelector(".list");

  btnDelete.addEventListener("click", findAndRemoveProduct);

  document.querySelector("#deleteOne").addEventListener("click", function () {
    popUp.classList.remove("hide");
  });

  document.querySelector("span").addEventListener("click", hidePopUp);

  btnDeleteAllProducts.addEventListener("click", deleteAllProducts);
  document.querySelector("#submit").addEventListener("click", getValue);
});
