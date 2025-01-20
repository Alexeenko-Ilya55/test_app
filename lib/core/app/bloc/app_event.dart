part of 'app_bloc.dart';

sealed class AppEvent {}

final class UpdateToken extends AppEvent {
  final String? newToken;

  UpdateToken(this.newToken);
}
