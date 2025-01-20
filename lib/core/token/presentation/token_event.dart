part of 'token_bloc.dart';


sealed class TokenEvent {}

final class TokenUpdate extends TokenEvent {
  final String? newToken;

  TokenUpdate(this.newToken);
}

final class RemoveToken extends TokenEvent {}