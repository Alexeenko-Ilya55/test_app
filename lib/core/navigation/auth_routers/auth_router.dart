import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/core/navigation/auth_routers/auth_guard.dart';
import 'package:test_app/core/navigation/auth_routers/auth_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
@Named('AuthRouter')
@singleton
class AuthRouter extends $AuthRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: InfoRoute.page,
      initial: true,
      path: '/info',
      guards: [
        AuthGuard(),
      ],
    ),
  ];
}
