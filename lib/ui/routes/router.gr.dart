// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:dirm_vfd/ui/initial_pages/loading/page.dart' as _i2;
import 'package:dirm_vfd/ui/initial_pages/login/page.dart' as _i3;
import 'package:dirm_vfd/ui/initial_pages/sign_up/page.dart' as _i5;
import 'package:dirm_vfd/ui/pages/home/page.dart' as _i1;
import 'package:dirm_vfd/ui/pages/initial/page.dart' as _i4;
import 'package:dirm_vfd/ui/pages/my_receipts/page.dart' as _i6;
import 'package:dirm_vfd/ui/pages/new_receipt/page.dart' as _i7;
import 'package:dirm_vfd/ui/pages/z_reports/page.dart' as _i8;

abstract class $AppRouter extends _i9.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.HomePage(),
      );
    },
    InitialLoadingRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.InitialLoadingPage(),
      );
    },
    InitialLoginRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.InitialLoginPage(),
      );
    },
    InitialRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.InitialPage(),
      );
    },
    InitialSignUpRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.InitialSignUpPage(),
      );
    },
    MyReceiptsRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.MyReceiptsPage(),
      );
    },
    NewReceiptRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.NewReceiptPage(),
      );
    },
    ZReportsRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.ZReportsPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i9.PageRouteInfo<void> {
  const HomeRoute({List<_i9.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i2.InitialLoadingPage]
class InitialLoadingRoute extends _i9.PageRouteInfo<void> {
  const InitialLoadingRoute({List<_i9.PageRouteInfo>? children})
      : super(
          InitialLoadingRoute.name,
          initialChildren: children,
        );

  static const String name = 'InitialLoadingRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i3.InitialLoginPage]
class InitialLoginRoute extends _i9.PageRouteInfo<void> {
  const InitialLoginRoute({List<_i9.PageRouteInfo>? children})
      : super(
          InitialLoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'InitialLoginRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i4.InitialPage]
class InitialRoute extends _i9.PageRouteInfo<void> {
  const InitialRoute({List<_i9.PageRouteInfo>? children})
      : super(
          InitialRoute.name,
          initialChildren: children,
        );

  static const String name = 'InitialRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i5.InitialSignUpPage]
class InitialSignUpRoute extends _i9.PageRouteInfo<void> {
  const InitialSignUpRoute({List<_i9.PageRouteInfo>? children})
      : super(
          InitialSignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'InitialSignUpRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i6.MyReceiptsPage]
class MyReceiptsRoute extends _i9.PageRouteInfo<void> {
  const MyReceiptsRoute({List<_i9.PageRouteInfo>? children})
      : super(
          MyReceiptsRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyReceiptsRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i7.NewReceiptPage]
class NewReceiptRoute extends _i9.PageRouteInfo<void> {
  const NewReceiptRoute({List<_i9.PageRouteInfo>? children})
      : super(
          NewReceiptRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewReceiptRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i8.ZReportsPage]
class ZReportsRoute extends _i9.PageRouteInfo<void> {
  const ZReportsRoute({List<_i9.PageRouteInfo>? children})
      : super(
          ZReportsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ZReportsRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}
