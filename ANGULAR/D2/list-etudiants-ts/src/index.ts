import { students, Student } from './students.js';

function renderStudent(student: Student, students: Student[]) {
  const content = document.querySelector('#content') as HTMLDivElement;
  const divStudent = document.createElement('div');

  divStudent.innerHTML = `
    <strong>Name:</strong> ${student.name}
    <strong>Last Name:</strong> ${student.lastName}
    <strong>Age:</strong> ${student.age}
    <button>Delete</button>
  `;

  const button = divStudent.querySelector('button');

  button?.addEventListener('click', () => {
    deleteStudent(student, divStudent, students);
  });
  content.append(divStudent);
}

function renderAllStudents(students: Student[]) {
  const content = document.querySelector('#content') as HTMLDivElement;

  for (let student of students) {
    renderStudent(student, students);
  }
}

const divAverageAge = document.createElement('div');

function renderAverageAge(students: Student[]) {
  const content = document.querySelector('#content') as HTMLDivElement;

  divAverageAge.innerHTML = `
    <strong>Average Age:</strong> ${averageAge(students)}
  `;
  content.append(divAverageAge);
}

function deleteStudent(
  student: Student,
  divStudent: HTMLDivElement,
  students: Student[]
) {
  divStudent.remove();

  const positionStudent = students.indexOf(student);
  if (positionStudent != -1) {
    students.splice(positionStudent, 1);
  }
  renderAverageAge(students);
}

function averageAge(students: Student[]) {
  return (
    students.reduce((acc, student) => acc + student.age, 0) / students.length
  );
}

function addStudent() {
  const name = (document.querySelector('#name') as HTMLInputElement).value;
  const lastName = (document.querySelector('#lastName') as HTMLInputElement).value;
  const age = (document.querySelector('#age') as HTMLInputElement).valueAsNumber;

  let newStudent: Student = {
    name: name,
    lastName: lastName,
    age: age,
  };

  students.push(newStudent);
  renderStudent(newStudent, students);
}

const form = document.querySelector('form');

form?.addEventListener('submit', (e) => {
  e.preventDefault();
  addStudent();
  console.log(students);
});

renderAverageAge(students);
renderAllStudents(students);
