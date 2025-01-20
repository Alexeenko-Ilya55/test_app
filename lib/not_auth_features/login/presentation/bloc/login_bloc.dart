import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/not_auth_features/login/domain/usecases/login_usecase.dart';

part 'login_event.dart';
part 'login_state.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this._loginUseCase) : super(LoginInitial()) {
    on<RequestLogin>(_onRequestLogin);
  }

  final LoginUsecase _loginUseCase;

  Future<void> _onRequestLogin(RequestLogin event, Emitter emit) async {
    emit(LoginLoading());

    try {
      await _loginUseCase.execute();
      emit(LoginSuccess());
    } on Exception catch (exception, _) {
      emit(LoginFailure(exception: exception));
    }
  }
}
