// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i15;
import 'package:dirm_vfd/providers/_.dart' as _i17;
import 'package:dirm_vfd/ui/initial_pages/loading/page.dart' as _i4;
import 'package:dirm_vfd/ui/initial_pages/login/page.dart' as _i5;
import 'package:dirm_vfd/ui/initial_pages/sign_up/page.dart' as _i7;
import 'package:dirm_vfd/ui/pages/account/page.dart' as _i1;
import 'package:dirm_vfd/ui/pages/customers/page.dart' as _i2;
import 'package:dirm_vfd/ui/pages/home/page.dart' as _i3;
import 'package:dirm_vfd/ui/pages/initial/page.dart' as _i6;
import 'package:dirm_vfd/ui/pages/items/page.dart' as _i8;
import 'package:dirm_vfd/ui/pages/my_receipts/page.dart' as _i9;
import 'package:dirm_vfd/ui/pages/my_vfd/page.dart' as _i10;
import 'package:dirm_vfd/ui/pages/new_receipt/page.dart' as _i11;
import 'package:dirm_vfd/ui/pages/preview_receipt/page.dart' as _i12;
import 'package:dirm_vfd/ui/pages/receipt/page.dart' as _i13;
import 'package:dirm_vfd/ui/pages/z_reports/page.dart' as _i14;
import 'package:flutter/foundation.dart' as _i18;
import 'package:flutter/material.dart' as _i16;

abstract class $AppRouter extends _i15.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i15.PageFactory> pagesMap = {
    AccountRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AccountPage(),
      );
    },
    CustomersRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.CustomersPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomePage(),
      );
    },
    InitialLoadingRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.InitialLoadingPage(),
      );
    },
    InitialLoginRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.InitialLoginPage(),
      );
    },
    InitialRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.InitialPage(),
      );
    },
    InitialSignUpRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.InitialSignUpPage(),
      );
    },
    ItemsRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.ItemsPage(),
      );
    },
    MyReceiptsRoute.name: (routeData) {
      final args = routeData.argsAs<MyReceiptsRouteArgs>(
          orElse: () => const MyReceiptsRouteArgs());
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.MyReceiptsPage(
          key: args.key,
          searchReceiptsProvider: args.searchReceiptsProvider,
        ),
      );
    },
    MyVFDRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.MyVFDPage(),
      );
    },
    NewReceiptRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.NewReceiptPage(),
      );
    },
    PreviewReceiptRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.PreviewReceiptPage(),
      );
    },
    ReceiptRoute.name: (routeData) {
      final args = routeData.argsAs<ReceiptRouteArgs>();
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i13.ReceiptPage(
          key: args.key,
          receiptId: args.receiptId,
        ),
      );
    },
    ZReportsRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.ZReportsPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.AccountPage]
class AccountRoute extends _i15.PageRouteInfo<void> {
  const AccountRoute({List<_i15.PageRouteInfo>? children})
      : super(
          AccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i2.CustomersPage]
class CustomersRoute extends _i15.PageRouteInfo<void> {
  const CustomersRoute({List<_i15.PageRouteInfo>? children})
      : super(
          CustomersRoute.name,
          initialChildren: children,
        );

  static const String name = 'CustomersRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i15.PageRouteInfo<void> {
  const HomeRoute({List<_i15.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i4.InitialLoadingPage]
class InitialLoadingRoute extends _i15.PageRouteInfo<void> {
  const InitialLoadingRoute({List<_i15.PageRouteInfo>? children})
      : super(
          InitialLoadingRoute.name,
          initialChildren: children,
        );

  static const String name = 'InitialLoadingRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i5.InitialLoginPage]
class InitialLoginRoute extends _i15.PageRouteInfo<void> {
  const InitialLoginRoute({List<_i15.PageRouteInfo>? children})
      : super(
          InitialLoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'InitialLoginRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i6.InitialPage]
class InitialRoute extends _i15.PageRouteInfo<void> {
  const InitialRoute({List<_i15.PageRouteInfo>? children})
      : super(
          InitialRoute.name,
          initialChildren: children,
        );

  static const String name = 'InitialRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i7.InitialSignUpPage]
class InitialSignUpRoute extends _i15.PageRouteInfo<void> {
  const InitialSignUpRoute({List<_i15.PageRouteInfo>? children})
      : super(
          InitialSignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'InitialSignUpRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i8.ItemsPage]
class ItemsRoute extends _i15.PageRouteInfo<void> {
  const ItemsRoute({List<_i15.PageRouteInfo>? children})
      : super(
          ItemsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ItemsRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i9.MyReceiptsPage]
class MyReceiptsRoute extends _i15.PageRouteInfo<MyReceiptsRouteArgs> {
  MyReceiptsRoute({
    _i16.Key? key,
    _i17.SearchReceiptsProvider? searchReceiptsProvider,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          MyReceiptsRoute.name,
          args: MyReceiptsRouteArgs(
            key: key,
            searchReceiptsProvider: searchReceiptsProvider,
          ),
          initialChildren: children,
        );

  static const String name = 'MyReceiptsRoute';

  static const _i15.PageInfo<MyReceiptsRouteArgs> page =
      _i15.PageInfo<MyReceiptsRouteArgs>(name);
}

class MyReceiptsRouteArgs {
  const MyReceiptsRouteArgs({
    this.key,
    this.searchReceiptsProvider,
  });

  final _i16.Key? key;

  final _i17.SearchReceiptsProvider? searchReceiptsProvider;

  @override
  String toString() {
    return 'MyReceiptsRouteArgs{key: $key, searchReceiptsProvider: $searchReceiptsProvider}';
  }
}

/// generated route for
/// [_i10.MyVFDPage]
class MyVFDRoute extends _i15.PageRouteInfo<void> {
  const MyVFDRoute({List<_i15.PageRouteInfo>? children})
      : super(
          MyVFDRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyVFDRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i11.NewReceiptPage]
class NewReceiptRoute extends _i15.PageRouteInfo<void> {
  const NewReceiptRoute({List<_i15.PageRouteInfo>? children})
      : super(
          NewReceiptRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewReceiptRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i12.PreviewReceiptPage]
class PreviewReceiptRoute extends _i15.PageRouteInfo<void> {
  const PreviewReceiptRoute({List<_i15.PageRouteInfo>? children})
      : super(
          PreviewReceiptRoute.name,
          initialChildren: children,
        );

  static const String name = 'PreviewReceiptRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i13.ReceiptPage]
class ReceiptRoute extends _i15.PageRouteInfo<ReceiptRouteArgs> {
  ReceiptRoute({
    _i18.Key? key,
    required int receiptId,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          ReceiptRoute.name,
          args: ReceiptRouteArgs(
            key: key,
            receiptId: receiptId,
          ),
          initialChildren: children,
        );

  static const String name = 'ReceiptRoute';

  static const _i15.PageInfo<ReceiptRouteArgs> page =
      _i15.PageInfo<ReceiptRouteArgs>(name);
}

class ReceiptRouteArgs {
  const ReceiptRouteArgs({
    this.key,
    required this.receiptId,
  });

  final _i18.Key? key;

  final int receiptId;

  @override
  String toString() {
    return 'ReceiptRouteArgs{key: $key, receiptId: $receiptId}';
  }
}

/// generated route for
/// [_i14.ZReportsPage]
class ZReportsRoute extends _i15.PageRouteInfo<void> {
  const ZReportsRoute({List<_i15.PageRouteInfo>? children})
      : super(
          ZReportsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ZReportsRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}
