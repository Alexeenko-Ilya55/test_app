import 'package:auto_route/auto_route.dart';
import 'package:test_app/core/di/app_module.dart';
import 'package:test_app/core/token/domain/repositories/token_repository.dart';

class AuthGuard extends AutoRouteGuard {

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final tokenRepository = getIt<TokenRepository>();

    resolver.next(tokenRepository.isAuthorized);
  }
}