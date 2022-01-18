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
  @Input() region!: Region;
  private http: HttpClient;


  constructor(http: HttpClient) {
    this.http = http;
  }

  ngOnInit(): void {
  }

  requestData() {
    let link = "https://geo.api.gouv.fr/regions";
    console.log(this.http.get(link))
    lastValueFrom(this.http.get("https://geo.api.gouv.fr/regions"))
      .then(donnees => console.log(donnees));
  }

}
