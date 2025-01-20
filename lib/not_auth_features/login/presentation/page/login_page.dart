import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/localization.dart';
import 'package:test_app/core/di/app_module.dart';
import 'package:test_app/core/theme/common_size.dart';
import 'package:test_app/not_auth_features/login/presentation/bloc/login_bloc.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = Localization.of(context)!;

    return BlocProvider(
      create: (context) => getIt<LoginBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(localization.loginInApp),
        ),
        body: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            if (state is LoginLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(CommonSize.medium),
                  child: Text(localization.loginDescription),
                ),
                const SizedBox(height: CommonSize.large),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: CommonSize.medium,
                  ),
                  child: ElevatedButton(
                    onPressed: () =>
                        BlocProvider.of<LoginBloc>(context).add(RequestLogin()),
                    child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        localization.login,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
