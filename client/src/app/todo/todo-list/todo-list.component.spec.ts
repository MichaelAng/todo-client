/* tslint:disable:no-unused-variable */
import { async, ComponentFixture, TestBed } from '@angular/core/testing';
import { By } from '@angular/platform-browser';
import { DebugElement } from '@angular/core';
import { RouterTestingModule } from '@angular/router/testing';
import { NO_ERRORS_SCHEMA } from '@angular/core';

import { Observable } from 'rxjs/Rx';

import { TodoListComponent } from './todo-list.component';
import { Todo } from '../models/todo.model';
import { TodoService } from '../shared/todo.service';

class MockTestService {
  public getTodos(): Observable<Todo[]> {
    return Observable.of([new Todo(), new Todo()]);
  }
}

describe('TodoListComponent', () => {
  let component: TodoListComponent;
  let fixture: ComponentFixture<TodoListComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      imports: [
        RouterTestingModule.withRoutes([
          { path: 'todos', component: TodoListComponent }
        ])
      ],
      providers: [
          {provide: TodoService, useClass: MockTestService}
      ],
      declarations: [ TodoListComponent],
      schemas: [ NO_ERRORS_SCHEMA ] // For Shallow component test
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(TodoListComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
