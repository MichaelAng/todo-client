import { NgModule, Optional, SkipSelf }       from '@angular/core';
import { CommonModule }      from '@angular/common';

import { HeaderComponent }    from './header/header.component';
import { NotFoundComponent }    from './not-found/not-found.component';

@NgModule({
  imports:      [ CommonModule ],
  declarations: [
    HeaderComponent,
    NotFoundComponent
  ],
  exports:      [
    HeaderComponent,
    NotFoundComponent
  ]
})
export class CoreModule {

  constructor (@Optional() @SkipSelf() parentModule: CoreModule) {
    if (parentModule) {
      throw new Error('CoreModule is already loaded. Import it in the AppModule only');
    }
  }

}
