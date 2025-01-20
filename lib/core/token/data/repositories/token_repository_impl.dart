
import 'package:injectable/injectable.dart';
import 'package:test_app/core/token/domain/repositories/token_repository.dart';

@Singleton(as: TokenRepository)
class TokenRepositoryImpl extends TokenRepository {
  String? _token;

  @override
  bool get isAuthorized => _token != null;

  @override
  Future<String?> getToken() async => Future.value(_token);

  @override
  Future<bool> setToken(String newToken) async {
    _token = newToken;
    return Future.value(true);
  }
}