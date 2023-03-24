import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { LoginComponent } from './user/login/login.component';
import { RegisComponent } from './user/regis/regis.component';
import { ShowPartsComponent } from './pctable/show-parts/show-parts.component';
import { AddEditPartsComponent } from './pctable/add-edit-parts/add-edit-parts.component';

const routes: Routes = [
  {path: 'login', component: LoginComponent},
  {path: 'regis', component: RegisComponent},
  {path: 'showparts', component: ShowPartsComponent},
  {path: 'addeditparts', component: AddEditPartsComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
