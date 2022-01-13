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
    const content = document.querySelector('#content');
    for (let student of students) {
        renderStudent(student, students);
    }
}
const divAverageAge = document.createElement('div');
function renderAverageAge(students) {
    const content = document.querySelector('#content');
    divAverageAge.innerHTML = `
    <strong>Average Age:</strong> ${averageAge(students)}
  `;
    content.append(divAverageAge);
}
function deleteStudent(student, divStudent, students) {
    divStudent.remove();
    const positionStudent = students.indexOf(student);
    if (positionStudent != -1) {
        students.splice(positionStudent, 1);
    }
    renderAverageAge(students);
}
function averageAge(students) {
    return (students.reduce((acc, student) => acc + student.age, 0) / students.length);
}
function addStudent() {
    const name = document.querySelector('#name').value;
    const lastName = document.querySelector('#lastName').value;
    const age = document.querySelector('#age').valueAsNumber;
    let newStudent = {
        name: name,
        lastName: lastName,
        age: age,
    };
    students.push(newStudent);
    renderStudent(newStudent, students);
}
const form = document.querySelector('1');
form === null || form === void 0 ? void 0 : form.addEventListener('submit', (e) => {
    e.preventDefault();
    addStudent();
    console.log(students);
});
renderAverageAge(students);
renderAllStudents(students);
//# sourceMappingURL=index.js.map