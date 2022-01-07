import { students, Student } from './students.js';

students.map((student) => {
  const div = (document.querySelector('#content') as HTMLDivElement);
  div.innerHTML += `<div><strong>Name:</strong> ${student.name} <strong>Last Name:</strong> ${student.lastName} <strong>Age:</strong> ${student.age}</div>`
  div.innerHTML += `<button>Delete</button>`;
})