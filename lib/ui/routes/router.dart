import 'package:auto_route/auto_route.dart';
import 'package:dirm_vfd/ui/routes/router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: InitialRoute.page, initial: true, children: [
          AutoRoute(page: InitialLoadingRoute.page, initial: true),
          AutoRoute(page: InitialLoginRoute.page),
          AutoRoute(page: InitialSignUpRoute.page),
        ]),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: NewReceiptRoute.page),
        AutoRoute(page: MyReceiptsRoute.page),
        AutoRoute(page: ZReportsRoute.page),
      ];
}
