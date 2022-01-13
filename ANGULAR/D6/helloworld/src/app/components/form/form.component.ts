import { Component, EventEmitter, OnInit, Output } from '@angular/core';
import { Student } from '../../models/student';
import { NgForm } from '@angular/forms';

@Component({
  selector: 'app-form',
  templateUrl: './form.component.html',
  styleUrls: ['./form.component.css']
})
export class FormComponent implements OnInit {
  @Output() requestAdd: EventEmitter<Student>
  name!: string;
  lastName!: string;
  age!: number;

  constructor() {
    this.requestAdd = new EventEmitter();
  }

  ngOnInit(): void {
  }

  handleClickAdd(form: NgForm) {
    let student = new Student(this.name, this.lastName, this.age);
    this.requestAdd.emit(student);

    form.reset();
  }
}
