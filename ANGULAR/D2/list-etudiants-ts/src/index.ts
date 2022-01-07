import { students, Student } from './students.js';

function renderStudent(student: Student, students: Student[]) {
  const content = (document.querySelector('#content') as HTMLDivElement);
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
  })
  content.append(divStudent);
}

function renderAllStudents(students: Student[]) {
  for (let student of students) {
    renderStudent(student, students)
  }
}

function deleteStudent(student: Student, divStudent: HTMLDivElement, students: Student[]) {
  divStudent.remove();

  const positionStudent = students.indexOf(student);
  if (positionStudent != -1) {
    students.splice(positionStudent, 1)
  }
}

renderAllStudents(students)