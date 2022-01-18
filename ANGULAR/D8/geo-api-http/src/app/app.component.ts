import { Component } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'geo-api-http';
  // http: HttpClient;

  constructor() {
    // this.http = http;
  }

  // requestData() {
  //   let link = "https://geo.api.gouv.fr/regions";
  //   console.log(this.http.get(link))
  // }

}
