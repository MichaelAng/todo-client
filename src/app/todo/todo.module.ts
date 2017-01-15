import { NgModule }       from '@angular/core';
import { CommonModule }      from '@angular/common';

import { TodoListComponent }    from './todo-list/todo-list.component';
import { TodoRoutingModule }    from './todo-routing.module';

@NgModule({
  imports:      [
    CommonModule,
    TodoRoutingModule
  ],
  declarations: [
    TodoListComponent
  ],
  exports:      []
})
export class TodoModule { }
