import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/core/di/app_module.dart';
import 'package:test_app/core/token/presentation/token_bloc.dart';

class TokenBlocProvider extends StatelessWidget {
  final Widget Function(BuildContext, TokenState) builder;

  const TokenBlocProvider({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TokenBloc>(
      create: (_) => getIt<TokenBloc>(),
      child: BlocBuilder<TokenBloc, TokenState>(
        builder: (context, state) => builder(context, state),
      ),
    );
  }
}
