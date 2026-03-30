import '../../../../../core/services/local/shared_pref_service.dart';
import '../../../../../core/services/local/storage_keys.dart';
import 'auth_local_data_source.dart';

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  const AuthLocalDataSourceImpl(this._sharedPrefService);

  final SharedPrefService _sharedPrefService;

  //////////// Token ////////////////
  @override
  Future<bool> saveToken(String token) {
    return _sharedPrefService.setString(StorageKeys.authToken, token);
  }

  @override
  String? getToken() {
    final String token = _sharedPrefService.getString(StorageKeys.authToken);
    if (token.isEmpty) null;
    return token;
  }

  //////////// Email ////////////////
  @override
  Future<bool> saveUserEmail(String email) {
    return _sharedPrefService.setString(StorageKeys.userEmail, email);
  }

  @override
  String? getUserEmail() {
    final String email = _sharedPrefService.getString(StorageKeys.userEmail);
    if (email.isEmpty) null;
    return email;
  }

  //////////// user name //////////////

  @override
  Future<bool> saveUserName(String userName) {
    return _sharedPrefService.setString(StorageKeys.userName, userName);
  }

  @override
  String? getUserName() {
    final String userName = _sharedPrefService.getString(StorageKeys.userName);
    if (userName.isEmpty) null;
    return userName;
  }

  //////////// Common ////////////////
  @override
  Future<bool> clearSession() async {
    final bool removedToken = await _sharedPrefService.remove(
      StorageKeys.authToken,
    );

    final bool removedEmail = await _sharedPrefService.remove(
      StorageKeys.userEmail,
    );

    return removedToken && removedEmail;
  }

  @override
  bool hasToken() {
    final String? token = getToken();
    return token != null && token.isNotEmpty;
  }
}
