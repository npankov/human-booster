import { Component, Input, OnInit } from '@angular/core';
import { DepartementAPI, Region } from '../../models/types';
import { HttpClient } from '@angular/common/http';
import { lastValueFrom } from 'rxjs';

@Component({
  selector: 'app-region',
  templateUrl: './region.component.html',
  styleUrls: ['./region.component.css']
})
export class RegionComponent implements OnInit {
  @Input() public region!: Region;

  constructor(private http: HttpClient) { }

  ngOnInit(): void {
  }

  chargerDepartements() {
    const link = 'https://geo.api.gouv.fr/departements?codeRegion=';
    lastValueFrom(this.http.get<DepartementAPI[]>(link + this.region.code))
      .then((data) => this.region.listDepartements = data)
  }

}
