part of 'app_bloc.dart';

class AppState {
  String? token;
  Locale locale;

  AppState({required this.locale, this.token});

  AppState copyWith({
    String? token,
    Locale? locale,
  }) =>
      AppState(
        locale: locale ?? this.locale,
        token: token ?? this.token,
      );
}
