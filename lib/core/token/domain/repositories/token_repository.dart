abstract class TokenRepository {

  bool get isAuthorized;

  Future<String?> getToken();

  Future<bool> setToken(String newToken);
}