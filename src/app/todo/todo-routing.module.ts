import { NgModule }             from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

import { TodoListComponent }    from './todo-list/todo-list.component';

const todosRoutes: Routes = [
  { path: 'todos',  component: TodoListComponent },
];

@NgModule({
  imports: [
    RouterModule.forChild(todosRoutes)
  ],
  exports: [
    RouterModule
  ]
})
export class TodoRoutingModule { }
