import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localization.dart';
import 'package:test_app/core/di/app_module.dart';
import 'package:test_app/core/navigation/auth_routers/auth_router.dart';
import 'package:test_app/core/navigation/not_auth_routers/not_auth_router.dart';
import 'package:test_app/core/token/presentation/token_bloc_provider.dart';

class TestApp extends StatelessWidget {
  const TestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return TokenBlocProvider(
      builder: (context, state) {
        final router = state.token != null
            ? getIt.get<AuthRouter>(instanceName: 'AuthRouter')
            : getIt.get<NotAuthRouter>(instanceName: 'NotAuthRouter');

        return MaterialApp.router(
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.deepPurpleAccent,
            ),
            useMaterial3: true,
          ),
          localizationsDelegates: Localization.localizationsDelegates,
          supportedLocales: Localization.supportedLocales,
          routerConfig: router.config(),
        );
      },
    );
  }
}
