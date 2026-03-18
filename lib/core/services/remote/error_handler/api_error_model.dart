class ApiErrorModel {
  const ApiErrorModel({
    required this.status,
    required this.message,
    required this.errors,
  });

  final bool status;
  final String message;
  final List<String> errors;

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) {
    final dynamic rawErrors = json['errors'];

    return ApiErrorModel(
      status: json['status'] as bool? ?? false,
      message: json['message'] as String? ?? 'Unknown error',
      errors: rawErrors is List
          ? rawErrors.map((error) => error.toString()).toList()
          : const <String>[],
    );
  }
}
