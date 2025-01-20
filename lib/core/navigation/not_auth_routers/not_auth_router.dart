import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/core/navigation/not_auth_routers/not_auth_router.gr.dart';


@AutoRouterConfig(replaceInRouteName: 'Page,Route')
@Named(NotAuthRouter.className)
@singleton
class NotAuthRouter extends $NotAuthRouter {
  static const className = 'NotAuthRouter';

  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: LoginRoute.page,
      initial: true,
      path: '/',
    ),
  ];
}