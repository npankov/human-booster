import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { Student } from '../../models/student';

@Component({
  selector: 'app-student',
  templateUrl: './student.component.html',
  styleUrls: ['./student.component.css']
})
export class StudentComponent implements OnInit {
  @Input() student!: Student;
  @Output() requestDelete: EventEmitter<any>;

  constructor() {
    this.requestDelete = new EventEmitter();
  }

  ngOnInit(): void {
  }

  handleClick() {
    this.requestDelete.emit();
  }

}
