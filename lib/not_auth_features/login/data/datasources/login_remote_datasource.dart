import 'package:injectable/injectable.dart';
import 'package:test_app/not_auth_features/login/data/service/login_service_api.dart';

@singleton
class LoginRemoteDatasource {
  final LoginServiceApi _loginService;

  LoginRemoteDatasource(this._loginService);

  Future<String> login() => _loginService.login();
}