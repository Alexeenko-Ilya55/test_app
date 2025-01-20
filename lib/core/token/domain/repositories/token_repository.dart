abstract class TokenRepository {

  bool get isAuthorized;

  Stream<String?> get tokenUpdates;

  Future<String?> getToken();

  Future<bool> setToken(String newToken);
}