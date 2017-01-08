import { Component } from '@angular/core';
import { ConfirmationService, Message } from 'primeng/primeng';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css'],
  providers: [ConfirmationService]
})
export class AppComponent {
  title = 'app works!';
  msgs: Message[] = [];

  constructor(private confirmationService: ConfirmationService) {}

  confirm1() {
    this.confirmationService.confirm({
      message: 'Are you sure that you want to perform this action?',
        accept: () => {
          this.msgs = [];
            this.msgs.push({severity: 'info', summary: 'Confirmed', detail: 'You have accepted'});
          }
      });
  }

  confirm2() {
    this.confirmationService.confirm({
      message: 'Do you want to delete this record?',
      header: 'Delete Confirmation',
      icon: 'fa fa-trash',
      accept: () => {
        this.msgs = [];
          this.msgs.push({severity: 'info', summary: 'Confirmed', detail: 'Record deleted'});
        }
      });
  }
}
