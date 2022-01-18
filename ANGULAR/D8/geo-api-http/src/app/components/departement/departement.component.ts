import { Component, Input, OnInit } from '@angular/core';
import { Departement } from '../../models/types';

@Component({
  selector: 'app-departement',
  templateUrl: './departement.component.html',
  styleUrls: ['./departement.component.css']
})
export class DepartementComponent implements OnInit {
  @Input() public departement!: Departement;

  constructor() { }

  ngOnInit(): void {
  }

}
