import '../repositories/auth_session_manager_store.dart';

class HasSessionUseCase {
  const HasSessionUseCase(this._authSessionStore);

  final AuthSessionStore _authSessionStore;

  bool call() => _authSessionStore.hasSession;
}
