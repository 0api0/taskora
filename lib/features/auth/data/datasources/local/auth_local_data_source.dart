abstract class AuthLocalDataSource {
  // Token
  Future<bool> saveToken(String token);
  String? getToken();

  // Email
  Future<bool> saveUserEmail(String email);
  String? getUserEmail();

  // username
  Future<bool> saveUserName(String userName);
  String? getUserName();

  // remember me
  Future<bool> saveRememberMe(bool value);
  bool getRememberMe();

  // Common
  Future<bool> clearSession();
  bool hasToken();
}
