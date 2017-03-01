import { Injectable } from '@angular/core';
import { Http, Response, Headers, RequestOptions } from '@angular/http';

import { Observable } from 'rxjs/Rx';

// Import RxJs required methods
import 'rxjs/add/operator/map';
import 'rxjs/add/operator/catch';

import { Todo } from '../models/todo.model';

@Injectable()
export class TodoService {
  private todoUrl = '/api/todos';
  private headers = new Headers({ 'Content-Type': 'application/json' }); // Set content type to JSON
  private options = new RequestOptions({ headers: this.headers }); // Create a request option

  constructor(
    private http: Http
  ) { }

  getTodos(): Observable<Todo[]> {
    return this.http.get(`${this.todoUrl}`, this.options)
      .map((res: Response) => res.json())
      .catch((error: any) => Observable.throw(error.json().error || 'Server error'));
  }
}
