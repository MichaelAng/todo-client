import { Component, OnInit } from '@angular/core';

import { Todo } from '../models/todo.model';

@Component({
  selector: 'app-todo-list',
  templateUrl: './todo-list.component.html',
  styleUrls: ['./todo-list.component.scss']
})
export class TodoListComponent implements OnInit {
  private todo: Todo[] = [
    { id: 1, title: 'somename', complete: false },
    { id: 1, title: 'somename', complete: false },
    { id: 1, title: 'somename', complete: false },
    { id: 1, title: 'somename', complete: false },
    { id: 1, title: 'somename', complete: false }
  ];

  constructor() { }

  ngOnInit() {
  }

}
