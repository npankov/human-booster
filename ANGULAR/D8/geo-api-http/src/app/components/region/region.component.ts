import { Component, Input, OnInit } from '@angular/core';
import { Region } from '../../models/types';
import { HttpClient } from '@angular/common/http';
import { lastValueFrom } from 'rxjs';

@Component({
  selector: 'app-region',
  templateUrl: './region.component.html',
  styleUrls: ['./region.component.css']
})
export class RegionComponent implements OnInit {
  @Input() public region!: Region;

  constructor() { }

  ngOnInit(): void {
  }

}
