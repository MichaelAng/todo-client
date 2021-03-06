import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

import { CheckboxModule } from 'primeng/primeng';

import { TodoItemComponent } from './todo-item/todo-item.component';
import { TodoListComponent } from './todo-list/todo-list.component';
import { TodoRoutingModule } from './todo-routing.module';
import { TodoService } from './shared/todo.service';

@NgModule({
  imports:      [
    CommonModule,
    FormsModule,

    CheckboxModule,

    TodoRoutingModule
  ],
  declarations: [
    TodoItemComponent,
    TodoListComponent
  ],
  exports:      [],
  providers: [
    TodoService
  ]
})
export class TodoModule { }
