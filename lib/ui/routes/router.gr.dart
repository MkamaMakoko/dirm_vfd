// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i12;
import 'package:dirm_vfd/ui/initial_pages/loading/page.dart' as _i3;
import 'package:dirm_vfd/ui/initial_pages/login/page.dart' as _i4;
import 'package:dirm_vfd/ui/initial_pages/sign_up/page.dart' as _i6;
import 'package:dirm_vfd/ui/pages/customers/page.dart' as _i1;
import 'package:dirm_vfd/ui/pages/home/page.dart' as _i2;
import 'package:dirm_vfd/ui/pages/initial/page.dart' as _i5;
import 'package:dirm_vfd/ui/pages/items/page.dart' as _i7;
import 'package:dirm_vfd/ui/pages/my_receipts/page.dart' as _i8;
import 'package:dirm_vfd/ui/pages/new_item/page.dart' as _i9;
import 'package:dirm_vfd/ui/pages/new_receipt/page.dart' as _i10;
import 'package:dirm_vfd/ui/pages/z_reports/page.dart' as _i11;
import 'package:flutter/material.dart' as _i13;

abstract class $AppRouter extends _i12.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i12.PageFactory> pagesMap = {
    CustomersRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.CustomersPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomePage(),
      );
    },
    InitialLoadingRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.InitialLoadingPage(),
      );
    },
    InitialLoginRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.InitialLoginPage(),
      );
    },
    InitialRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.InitialPage(),
      );
    },
    InitialSignUpRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.InitialSignUpPage(),
      );
    },
    ItemsRoute.name: (routeData) {
      final args = routeData.argsAs<ItemsRouteArgs>();
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.ItemsPage(
          key: args.key,
          pickMode: args.pickMode,
        ),
      );
    },
    MyReceiptsRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.MyReceiptsPage(),
      );
    },
    NewItemRoute.name: (routeData) {
      final args = routeData.argsAs<NewItemRouteArgs>(
          orElse: () => const NewItemRouteArgs());
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.NewItemPage(key: args.key),
      );
    },
    NewReceiptRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.NewReceiptPage(),
      );
    },
    ZReportsRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.ZReportsPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.CustomersPage]
class CustomersRoute extends _i12.PageRouteInfo<void> {
  const CustomersRoute({List<_i12.PageRouteInfo>? children})
      : super(
          CustomersRoute.name,
          initialChildren: children,
        );

  static const String name = 'CustomersRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i12.PageRouteInfo<void> {
  const HomeRoute({List<_i12.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i3.InitialLoadingPage]
class InitialLoadingRoute extends _i12.PageRouteInfo<void> {
  const InitialLoadingRoute({List<_i12.PageRouteInfo>? children})
      : super(
          InitialLoadingRoute.name,
          initialChildren: children,
        );

  static const String name = 'InitialLoadingRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i4.InitialLoginPage]
class InitialLoginRoute extends _i12.PageRouteInfo<void> {
  const InitialLoginRoute({List<_i12.PageRouteInfo>? children})
      : super(
          InitialLoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'InitialLoginRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i5.InitialPage]
class InitialRoute extends _i12.PageRouteInfo<void> {
  const InitialRoute({List<_i12.PageRouteInfo>? children})
      : super(
          InitialRoute.name,
          initialChildren: children,
        );

  static const String name = 'InitialRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i6.InitialSignUpPage]
class InitialSignUpRoute extends _i12.PageRouteInfo<void> {
  const InitialSignUpRoute({List<_i12.PageRouteInfo>? children})
      : super(
          InitialSignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'InitialSignUpRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i7.ItemsPage]
class ItemsRoute extends _i12.PageRouteInfo<ItemsRouteArgs> {
  ItemsRoute({
    _i13.Key? key,
    required bool pickMode,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          ItemsRoute.name,
          args: ItemsRouteArgs(
            key: key,
            pickMode: pickMode,
          ),
          initialChildren: children,
        );

  static const String name = 'ItemsRoute';

  static const _i12.PageInfo<ItemsRouteArgs> page =
      _i12.PageInfo<ItemsRouteArgs>(name);
}

class ItemsRouteArgs {
  const ItemsRouteArgs({
    this.key,
    required this.pickMode,
  });

  final _i13.Key? key;

  final bool pickMode;

  @override
  String toString() {
    return 'ItemsRouteArgs{key: $key, pickMode: $pickMode}';
  }
}

/// generated route for
/// [_i8.MyReceiptsPage]
class MyReceiptsRoute extends _i12.PageRouteInfo<void> {
  const MyReceiptsRoute({List<_i12.PageRouteInfo>? children})
      : super(
          MyReceiptsRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyReceiptsRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i9.NewItemPage]
class NewItemRoute extends _i12.PageRouteInfo<NewItemRouteArgs> {
  NewItemRoute({
    _i13.Key? key,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          NewItemRoute.name,
          args: NewItemRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'NewItemRoute';

  static const _i12.PageInfo<NewItemRouteArgs> page =
      _i12.PageInfo<NewItemRouteArgs>(name);
}

class NewItemRouteArgs {
  const NewItemRouteArgs({this.key});

  final _i13.Key? key;

  @override
  String toString() {
    return 'NewItemRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i10.NewReceiptPage]
class NewReceiptRoute extends _i12.PageRouteInfo<void> {
  const NewReceiptRoute({List<_i12.PageRouteInfo>? children})
      : super(
          NewReceiptRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewReceiptRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i11.ZReportsPage]
class ZReportsRoute extends _i12.PageRouteInfo<void> {
  const ZReportsRoute({List<_i12.PageRouteInfo>? children})
      : super(
          ZReportsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ZReportsRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}
