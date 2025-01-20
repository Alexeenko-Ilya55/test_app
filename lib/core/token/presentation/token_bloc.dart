import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/core/token/domain/repositories/token_repository.dart';

part 'token_event.dart';

part 'token_state.dart';

@injectable
class TokenBloc extends Bloc<TokenEvent, TokenState> {
  final TokenRepository _tokenRepository;
  late StreamSubscription<String?> _streamSubscription;

  TokenBloc(this._tokenRepository) : super(TokenInitial(null)) {
    on<TokenUpdate>(_onUpdateToken);
    on<RemoveToken>(_onRemoveToken);

    _streamSubscription = _tokenRepository.tokenUpdates.listen(
      (token) => add(TokenUpdate(token)),
    );
  }

  void _onUpdateToken(TokenUpdate event, Emitter emit) async {
    emit(TokenLoaded(event.newToken));
  }

  Future<void> _onRemoveToken(_, Emitter emit) async {
    await _tokenRepository.removeToken();
    emit(TokenLoaded(null));
  }

  @override
  Future<void> close() {
    _streamSubscription.cancel();
    return super.close();
  }
}
