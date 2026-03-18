class ForgotPasswordVerificationEntity {
  const ForgotPasswordVerificationEntity({
    required this.email,
    required this.code,
  });

  final String email;
  final int code;
}
