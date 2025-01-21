import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/common/app_language/presentation/bloc/language_bloc.dart';
import 'package:test_app/core/di/app_module.dart';

class LanguageBlocProvider extends StatelessWidget {
  final Widget Function(BuildContext, LanguageState) builder;

  const LanguageBlocProvider({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LanguageBloc>(
      create: (_) => getIt<LanguageBloc>(),
      child: BlocBuilder<LanguageBloc, LanguageState>(
        builder: builder,
      ),
    );
  }
}
