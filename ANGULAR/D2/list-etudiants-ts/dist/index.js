import { students } from './students.js';
function renderStudent(student, students) {
    const content = document.querySelector('#content');
    const divStudent = document.createElement('div');
    divStudent.innerHTML = `
    <strong>Name:</strong> ${student.name}
    <strong>Last Name:</strong> ${student.lastName}
    <strong>Age:</strong> ${student.age}
    <button>Delete</button>
  `;
    const button = divStudent.querySelector('button');
    button === null || button === void 0 ? void 0 : button.addEventListener('click', () => {
        deleteStudent(student, divStudent, students);
    });
    content.append(divStudent);
}
function renderAllStudents(students) {
    for (let student of students) {
        renderStudent(student, students);
    }
}
function deleteStudent(student, divStudent, students) {
    divStudent.remove();
    const positionStudent = students.indexOf(student);
    if (positionStudent != -1) {
        students.splice(positionStudent, 1);
    }
}
renderAllStudents(students);
//# sourceMappingURL=index.js.map