import { Injectable } from '@angular/core';
import {HttpClient} from "@angular/common/http"
import { Observable } from 'rxjs';


@Injectable({
  providedIn: 'root'
})
export class AuthService {

  private baseUrl:string = "https://localhost:7054/api/Login/"
  constructor(private http: HttpClient) { }

  regis(userObj:any) {

    return this.http.post<any>(`${this.baseUrl}register`, userObj) 

  }

  login(loginObj:any) {

    return this.http.post<any>(`${this.baseUrl}login`, loginObj)
  }

  
}
