// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:dirm_vfd/ui/initial_pages/loading/page.dart' as _i3;
import 'package:dirm_vfd/ui/initial_pages/login/page.dart' as _i4;
import 'package:dirm_vfd/ui/initial_pages/sign_up/page.dart' as _i6;
import 'package:dirm_vfd/ui/pages/customers/page.dart' as _i1;
import 'package:dirm_vfd/ui/pages/home/page.dart' as _i2;
import 'package:dirm_vfd/ui/pages/initial/page.dart' as _i5;
import 'package:dirm_vfd/ui/pages/items/page.dart' as _i7;
import 'package:dirm_vfd/ui/pages/my_receipts/page.dart' as _i8;
import 'package:dirm_vfd/ui/pages/new_receipt/page.dart' as _i9;
import 'package:dirm_vfd/ui/pages/z_reports/page.dart' as _i10;

abstract class $AppRouter extends _i11.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    CustomersRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.CustomersPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomePage(),
      );
    },
    InitialLoadingRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.InitialLoadingPage(),
      );
    },
    InitialLoginRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.InitialLoginPage(),
      );
    },
    InitialRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.InitialPage(),
      );
    },
    InitialSignUpRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.InitialSignUpPage(),
      );
    },
    ItemsRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.ItemsPage(),
      );
    },
    MyReceiptsRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.MyReceiptsPage(),
      );
    },
    NewReceiptRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.NewReceiptPage(),
      );
    },
    ZReportsRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.ZReportsPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.CustomersPage]
class CustomersRoute extends _i11.PageRouteInfo<void> {
  const CustomersRoute({List<_i11.PageRouteInfo>? children})
      : super(
          CustomersRoute.name,
          initialChildren: children,
        );

  static const String name = 'CustomersRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i11.PageRouteInfo<void> {
  const HomeRoute({List<_i11.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i3.InitialLoadingPage]
class InitialLoadingRoute extends _i11.PageRouteInfo<void> {
  const InitialLoadingRoute({List<_i11.PageRouteInfo>? children})
      : super(
          InitialLoadingRoute.name,
          initialChildren: children,
        );

  static const String name = 'InitialLoadingRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i4.InitialLoginPage]
class InitialLoginRoute extends _i11.PageRouteInfo<void> {
  const InitialLoginRoute({List<_i11.PageRouteInfo>? children})
      : super(
          InitialLoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'InitialLoginRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i5.InitialPage]
class InitialRoute extends _i11.PageRouteInfo<void> {
  const InitialRoute({List<_i11.PageRouteInfo>? children})
      : super(
          InitialRoute.name,
          initialChildren: children,
        );

  static const String name = 'InitialRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i6.InitialSignUpPage]
class InitialSignUpRoute extends _i11.PageRouteInfo<void> {
  const InitialSignUpRoute({List<_i11.PageRouteInfo>? children})
      : super(
          InitialSignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'InitialSignUpRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i7.ItemsPage]
class ItemsRoute extends _i11.PageRouteInfo<void> {
  const ItemsRoute({List<_i11.PageRouteInfo>? children})
      : super(
          ItemsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ItemsRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i8.MyReceiptsPage]
class MyReceiptsRoute extends _i11.PageRouteInfo<void> {
  const MyReceiptsRoute({List<_i11.PageRouteInfo>? children})
      : super(
          MyReceiptsRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyReceiptsRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i9.NewReceiptPage]
class NewReceiptRoute extends _i11.PageRouteInfo<void> {
  const NewReceiptRoute({List<_i11.PageRouteInfo>? children})
      : super(
          NewReceiptRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewReceiptRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i10.ZReportsPage]
class ZReportsRoute extends _i11.PageRouteInfo<void> {
  const ZReportsRoute({List<_i11.PageRouteInfo>? children})
      : super(
          ZReportsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ZReportsRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}
