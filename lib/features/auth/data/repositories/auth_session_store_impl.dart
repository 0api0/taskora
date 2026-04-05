import 'package:taskora/features/auth/data/datasources/local/auth_local_data_source.dart';
import 'package:taskora/features/auth/domain/repositories/auth_session_manager_store.dart';

class AuthSessionStoreImpl extends AuthSessionStore {
  AuthSessionStoreImpl(this._authLocalDataSource);
  final AuthLocalDataSource _authLocalDataSource;
  //--------- value --------
  String? _token;
  String? _email;

  //------ get value -------
  @override
  String? get token => _token;
  @override
  String? get email => _email;

  //------- has ? -----------
  @override
  bool get hasSession => _authLocalDataSource.hasToken();

  // ------- set session --------
  @override
  void setSession({required String token, required String email}) {
    _token = token;
    _email = email;
  }

  //------ clear session --------
  @override
  void clearSession() {
    _token = null;
    _email = null;
  }
}
