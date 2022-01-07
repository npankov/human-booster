import { students } from './students.js';
students.map((student, id) => {
    const content = document.querySelector('#content');
    content.innerHTML += `<div id='${id}'><strong>Name:</strong> ${student.name} <strong>Last Name:</strong> ${student.lastName} <strong>Age:</strong> ${student.age} <button>Delete</button></div>`;
    console.log(student, id);
    const buttons = document.querySelectorAll('button');
    const div = document.getElementById(`${id}`);
    console.log(div);
    buttons.forEach((button) => {
        button.addEventListener('click', () => {
            div.remove();
        });
    });
});
//# sourceMappingURL=index.js.map