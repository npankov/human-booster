import { Component } from '@angular/core';
import { Student } from './models/student';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})

export class AppComponent {
  title = 'helloworld';
  people: Student[] = [
    new Student('Jean', 'Dupont', 33),
    new Student('Thomas', 'Dumont', 56, 'Citizen'),
    new Student('Lukas', 'Skywoker', 29, 'Citizen'),
    new Student('Taro', 'Willy', 17, 'No citizen')
  ];

  constructor() {
  }


}
