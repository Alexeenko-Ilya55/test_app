
abstract class LoginRepository {

  /// Method for login user, in case of success login return token
  Future<String> login();
}