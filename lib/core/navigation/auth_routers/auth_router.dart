import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/core/navigation/auth_routers/guards/auth_guard.dart';
import 'package:test_app/core/navigation/auth_routers/auth_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
@Named(AuthRouter.className)
@singleton
class AuthRouter extends $AuthRouter {
  static const className = 'AuthRouter';

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