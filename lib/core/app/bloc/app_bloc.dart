import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/common/app_language/domain/usecases/get_language_usecase.dart';
import 'package:test_app/common/app_language/domain/usecases/set_language_usecase.dart';
import 'package:test_app/core/token/domain/repositories/token_repository.dart';

part 'app_event.dart';

part 'app_state.dart';

@injectable
class AppBloc extends Bloc<AppEvent, AppState> {
  final TokenRepository _tokenRepository;
  final SetLanguageUseCase _setLanguageUsecase;
  late StreamSubscription<String?> _tokenUpdatesSubscription;

  AppBloc(
    this._tokenRepository,
    this._setLanguageUsecase,
    GetLanguageUseCase _getLanguageUsecase,
  ) : super(AppState(locale: _getLanguageUsecase.execute())) {
    on<UpdateToken>(_onTokenChanged);
    on<ChangeLanguage>(_onChangeLanguage);

    _tokenUpdatesSubscription = _tokenRepository.tokenUpdates.listen(
      (token) => add(UpdateToken(token)),
    );
  }

  void _onTokenChanged(UpdateToken event, Emitter emit) {
    emit(state.copyWith(token: event.newToken));
  }

  void _onChangeLanguage(ChangeLanguage event, Emitter emit) {
    _setLanguageUsecase.execute(event.locale);
    emit(state.copyWith(locale: event.locale));
  }

  @override
  Future<void> close() {
    _tokenUpdatesSubscription.cancel();
    return super.close();
  }
}
