"use strict";
let students = [
    {
        name: 'Nikolai',
        lastName: 'Pankov',
        age: 31
    },
    {
        name: 'Guillaume',
        lastName: 'Perroy',
        age: 26
    },
    {
        name: 'Emma',
        lastName: 'Segeral',
        age: 24
    },
    {
        name: 'Luka',
        lastName: 'Del Rosso',
        age: 23
    }
];
students.map((student) => {
    const div = document.querySelector('#content');
    div.innerHTML += `<div><strong>Name:</strong> ${student.name} <strong>Last Name:</strong> ${student.lastName} <strong>Age:</strong> ${student.age}</div>`;
});
