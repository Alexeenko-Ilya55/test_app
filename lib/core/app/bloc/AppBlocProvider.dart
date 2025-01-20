import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/core/app/bloc/app_bloc.dart';
import 'package:test_app/core/di/app_module.dart';

class AppBlocProvider extends StatelessWidget {
  final Widget Function(BuildContext, AppState) builder;

  const AppBlocProvider({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppBloc>(
      create: (_) => getIt(),
      child: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) => builder(context, state),
      ),
    );
  }
}
