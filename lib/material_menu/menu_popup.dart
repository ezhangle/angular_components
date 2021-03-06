// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:angular/angular.dart';
import 'package:angular_components/content/deferred_content.dart';
import 'package:angular_components/focus/focus.dart';
import 'package:angular_components/laminate/popup/popup.dart';
import 'package:angular_components/material_list/material_list.dart';
import 'package:angular_components/material_menu/menu_item_groups.dart';
import 'package:angular_components/material_menu/menu_popup_wrapper.dart';
import 'package:angular_components/material_menu/menu_root.dart';
import 'package:angular_components/material_popup/material_popup.dart';
import 'package:angular_components/mixins/focusable_mixin.dart';
import 'package:angular_components/model/menu/menu.dart';

/// A popup that renders a [MenuModel] using a [MenuItemGroupsComponent].
@Component(
  selector: 'menu-popup',
  directives: const [
    AutoFocusDirective,
    DeferredContentDirective,
    MaterialListComponent,
    MaterialPopupComponent,
    MenuItemGroupsComponent,
    MenuRootDirective,
    NgIf,
  ],
  templateUrl: 'menu_popup.html',
  styleUrls: const ['menu_popup.scss.css'],
  changeDetection: ChangeDetectionStrategy.OnPush,
  // TODO(google): Change preserveWhitespace to false to improve codesize.
  preserveWhitespace: true,
  // TODO(google): Change to `Visibility.local` to reduce code size.
  visibility: Visibility.all,
)
class MenuPopupComponent extends Object with FocusableMixin, MenuPopupWrapper {
  @Input()
  PopupSource popupSource;

  @ViewChild(MenuItemGroupsComponent)
  set menuItemGroups(MenuItemGroupsComponent groups) {
    focusable = groups;
  }
}
