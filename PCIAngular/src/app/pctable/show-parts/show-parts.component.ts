import { Component, OnInit } from '@angular/core';
import { ApiService } from 'src/app/services/api.service';
@Component({
  selector: 'app-show-parts',
  templateUrl: './show-parts.component.html',
  styleUrls: ['./show-parts.component.css']
})
export class ShowPartsComponent implements OnInit {

  constructor(private service: ApiService) {

  }

  PartsList:any=[];

  ModalTitle: string= " ";
  ActivateAddEditPartsComponent: boolean = false;
  part:any;
  ngOnInit(): void {

    this.refreshPartsList();
    
  }

  addClick() {
    this.part={
      id:0,
      tableName: "",
      name: "",
      code: "",
      brand:"",
      unitPrice:0
    }

    this.ModalTitle="Add PC Parts";
    this.ActivateAddEditPartsComponent=true;
  }

  closeClick() {
    this.ActivateAddEditPartsComponent=false;
    this.refreshPartsList();
  }

  editClick(item: any) {
    this.part=item;
    this.ModalTitle="Edit PC Parts";
    this.ActivateAddEditPartsComponent=true;

  }
  

  refreshPartsList() {
    this.service.getPartsList().subscribe(data=>{
      this.PartsList = data;
    })
  }

}