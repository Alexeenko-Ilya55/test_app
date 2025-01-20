part of 'token_bloc.dart';

sealed class TokenState {
  String? token;

  TokenState(this.token);
}

final class TokenInitial extends TokenState {
  TokenInitial(super.token);
}

final class TokenLoaded extends TokenState {
  TokenLoaded(super.token);
}

