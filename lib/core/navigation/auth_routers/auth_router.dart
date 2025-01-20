import 'package:auto_route/auto_route.dart';
import 'package:test_app/core/navigation/auth_routers/auth_guard.dart';
import 'package:test_app/core/navigation/auth_routers/auth_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AuthRouter extends $AuthRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: InfoRoute.page,
          initial: true,
          path: '/',
          guards: [
            AuthGuard(),
          ],
        ),
      ];
}