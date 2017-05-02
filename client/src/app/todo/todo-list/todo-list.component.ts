import { Component, OnInit } from '@angular/core';

import { Todo } from '../models/todo.model';
import { TodoService } from '../shared/todo.service';
@Component({
  selector: 'app-todo-list',
  templateUrl: './todo-list.component.html',
  styleUrls: ['./todo-list.component.scss']
})
export class TodoListComponent implements OnInit {
  todo: Todo[] = [
    { id: 1, title: 'somename', completed: false },
    { id: 1, title: 'somename', completed: false },
    { id: 1, title: 'somename', completed: false },
    { id: 1, title: 'somename', completed: false },
    { id: 1, title: 'somename', completed: false }
  ];

  constructor(
    private todoService: TodoService
  ) { }

  ngOnInit() {
    this.todoService.getTodos()
      .subscribe(
        console.log
      );

  }

}
