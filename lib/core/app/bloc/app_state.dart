part of 'app_bloc.dart';

class AppState {
  String? token;

  AppState({this.token});

  AppState copyWith({
    String? token,
  }) =>
      AppState(
        token: token ?? this.token,
      );
}
