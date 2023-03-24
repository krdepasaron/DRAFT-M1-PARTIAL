import { Injectable } from '@angular/core';
import {HttpClient} from "@angular/common/http"
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ApiService {
  private partsUrl:string = "https://localhost:7054/api/Parts/"
  constructor(private http: HttpClient) { }

  getPartsList():Observable<any[]>{
    return this.http.get<any>(this.partsUrl+'ReadData');

  }

  addParts(addP:any){
    return this.http.post(this.partsUrl+'CreateData', addP);
  }

  updateParts(updP:any){
    return this.http.post(this.partsUrl+'CreateData', updP);
  }

  deleteParts(delP:any){
    return this.http.delete(this.partsUrl+'DeleteData', delP);
  }

  buildParts():Observable<any[]>{
    return this.http.get<any[]>(this.partsUrl+'BuildPrice');
  }
}
