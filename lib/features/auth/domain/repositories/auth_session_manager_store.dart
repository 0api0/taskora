abstract class AuthSessionStore {
  String? get token;

  String? get email;

  //------- has ? -----------
  bool get hasSession;

  // ------- set session --------
  void setSession({required String token, required String email});

  //------ clear session --------
  void clearSession() {}
}
