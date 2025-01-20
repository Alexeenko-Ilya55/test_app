import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/core/token/domain/repositories/token_repository.dart';

part 'app_event.dart';

part 'app_state.dart';

@injectable
class AppBloc extends Bloc<AppEvent, AppState> {
  final TokenRepository _tokenRepository;
  late StreamSubscription<String?> _tokenUpdatesSubscription;

  AppBloc(this._tokenRepository) : super(AppState()) {
    on<UpdateToken>(_onTokenChanged);

    _tokenUpdatesSubscription = _tokenRepository.tokenUpdates.listen(
      (token) => add(UpdateToken(token)),
    );
  }

  void _onTokenChanged(UpdateToken event, Emitter emit) {
    emit(state.copyWith(token: event.newToken));
  }

  @override
  Future<void> close() {
    _tokenUpdatesSubscription.cancel();
    return super.close();
  }
}
