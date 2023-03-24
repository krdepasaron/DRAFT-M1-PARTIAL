import { Component, OnInit, Input } from '@angular/core';
import { ApiService } from 'src/app/services/api.service';
@Component({
  selector: 'app-add-edit-parts',
  templateUrl: './add-edit-parts.component.html',
  styleUrls: ['./add-edit-parts.component.css']
})
export class AddEditPartsComponent implements OnInit {

  constructor(private service: ApiService) {

  }

  @Input() part:any;
  id!: number;
  name!: string;
  brand!: string;
  code!:string;
  category!:string;
  tableName!:string;
  unitPrice!:number;

  ngOnInit(): void{

    this.id = this.part.id;
    this.name = this.part.name;
    this.brand = this.part.brand;
    this.code = this.part.code;
    this.tableName = this.part.tableName;
    this.unitPrice = this.part.unitPrice;
  }

  addParts() {
    var val = {
      name:this.name,
      brand:this.brand,
      code:this.code,
      tableName:this.tableName,
      unitPrice:this.unitPrice,
    };
    
    this.service.addParts(val).subscribe(res=>{
      alert(res.toString());
    });

  }

  updateParts() {
    var val = {
      name:this.name,
      brand:this.brand,
      code:this.code,
      //not sure
      category:this.category,
      unitPrice:this.unitPrice,
    };
    
    this.service.addParts(val).subscribe(res=>{
      alert(res.toString());
    });
  }
}
