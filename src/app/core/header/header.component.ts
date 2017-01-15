import { Component, OnInit } from '@angular/core';

import { MenuItem } from 'primeng/primeng';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.scss']
})
export class HeaderComponent implements OnInit {
  private items: MenuItem[];

  constructor() { }

  ngOnInit() {
    this.items = [
      { label: `ToDo's`, icon: 'fa-bar-chart', routerLink: ['/todos'] },
      { label: `ToDo's 1`, icon: 'fa-calendar', routerLink: ['/todos1'] },
      { label: `ToDo's 2`, icon: 'fa-book', routerLink: ['/todos2']  },
      { label: `ToDo's 3`, icon: 'fa-support', routerLink: ['/todos3']  },
      { label: `ToDo's 4`, icon: 'fa-twitter', routerLink: ['/todos4'] }
    ];
  }

}
