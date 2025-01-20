import 'package:injectable/injectable.dart';
import 'package:test_app/core/token/domain/repositories/token_repository.dart';
import 'package:test_app/not_auth_features/login/domain/reoistitories/login_repository.dart';

@injectable
class LoginUsecase {
  final LoginRepository _loginRepository;
  final TokenRepository _tokenRepository;

  LoginUsecase(this._loginRepository, this._tokenRepository);

  Future<void> execute() async {
    final newToken = await _loginRepository.login();

    await _tokenRepository.setToken(newToken);
  }
}
