import { NgModule }             from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

import { TodoListComponent }    from './todo-list/todo-list.component';

const todosRoutes: Routes = [
  { path: 'todos',  component: TodoListComponent },
  { path: 'todos1',  component: TodoListComponent, children: [
    { path: 'child',  component: TodoListComponent }
  ]},
  { path: 'todos2',  component: TodoListComponent },
  { path: 'todos3',  component: TodoListComponent },
  { path: 'todos4',  component: TodoListComponent }
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
