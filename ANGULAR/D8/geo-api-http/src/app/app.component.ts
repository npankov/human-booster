import { Component } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { lastValueFrom } from 'rxjs';
import { RegionAPI, Region, Departement } from './models/types';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'geo-api-http';
  public listRegions: Region[] = [];

  constructor(private http: HttpClient) {
    const link = 'https://geo.api.gouv.fr/regions';
    lastValueFrom(this.http.get<RegionAPI[]>(link))
      .then((data) => this.listRegions.push(...data))
  }

}
