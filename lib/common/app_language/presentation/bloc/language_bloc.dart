import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/common/app_language/domain/usecases/get_language_usecase.dart';
import 'package:test_app/common/app_language/domain/usecases/set_language_usecase.dart';

part 'language_event.dart';
part 'language_state.dart';

@injectable
class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  final SetLanguageUseCase _setLanguageUseCase;

  LanguageBloc(
    this._setLanguageUseCase,
    GetLanguageUseCase getLanguageUseCase,
  ) : super(LanguageState(getLanguageUseCase.execute())) {
    on<ChangeLanguage>(_onChangeLanguage);
  }

  void _onChangeLanguage(ChangeLanguage event, Emitter emit) {
    _setLanguageUseCase.execute(event.locale);
    emit(LanguageState(event.locale));
  }
}
