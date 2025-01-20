import 'package:injectable/injectable.dart';
import 'package:test_app/not_auth_features/login/data/datasources/login_remote_datasource.dart';
import 'package:test_app/not_auth_features/login/domain/reoistitories/login_repository.dart';

@Singleton(as: LoginRepository)
class LoginRepositoryImpl extends LoginRepository {
  final LoginRemoteDatasource _remoteDatasource;

  LoginRepositoryImpl(this._remoteDatasource);

  @override
  Future<String> login() async {
    try {
      return await _remoteDatasource.login();
    } catch(exception) {
      ///Exception handling/mapping place
      throw Exception(exception);
    }
  }
}