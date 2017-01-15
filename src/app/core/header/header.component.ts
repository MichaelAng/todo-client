import { Component, OnInit } from '@angular/core';
import { Router, NavigationEnd, PRIMARY_OUTLET, UrlSegmentGroup } from '@angular/router';

import 'rxjs/add/operator/filter';
import 'rxjs/add/operator/map';

import { MenuItem } from 'primeng/primeng';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.scss']
})
export class HeaderComponent implements OnInit {
  private activeItem: MenuItem;
  private items: MenuItem[];

  constructor(
    private router: Router
  ) { }

  ngOnInit() {
    this.router.events
      .filter(event => event instanceof NavigationEnd)
      .map(event => event.url)
      .subscribe(event => {
        let segmentGroup: UrlSegmentGroup = this.router.parseUrl(event).root.children[PRIMARY_OUTLET];
        this.activeItem = this.items.find(item => item.routerLink[0] === segmentGroup.segments[0].path);
      });

    this.items = [
      { label: `ToDo's`, icon: 'fa-bar-chart', routerLink: ['todos'] },
      { label: `ToDo's 1`, icon: 'fa-calendar', routerLink: ['todos1'] },
      { label: `ToDo's 2`, icon: 'fa-book', routerLink: ['todos2']  },
      { label: `ToDo's 3`, icon: 'fa-support', routerLink: ['todos3']  },
      { label: `ToDo's 4`, icon: 'fa-twitter', routerLink: ['todos4'] }
    ];
  }

}
