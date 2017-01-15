import { NgModule }              from '@angular/core';
import { RouterModule, Routes }  from '@angular/router';

import { NotFoundComponent }    from './core/not-found/not-found.component';
import { TodoListComponent }    from './todo/todo-list/todo-list.component';

const appRoutes: Routes = [
  { path: 'todos',        component: TodoListComponent },
  { path: '',   redirectTo: '/todos', pathMatch: 'full' },
  { path: '**', component: NotFoundComponent }
];
@NgModule({
  imports: [
    RouterModule.forRoot(appRoutes)
  ],
  exports: [
    RouterModule
  ]
})
export class AppRoutingModule {}
