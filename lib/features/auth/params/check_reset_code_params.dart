import 'package:equatable/equatable.dart';

class CheckResetCodeParams extends Equatable {
  const CheckResetCodeParams({required this.code});

  final int code;
  @override
  List<Object?> get props => [code];
}
