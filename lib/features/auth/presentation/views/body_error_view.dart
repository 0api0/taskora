import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:taskora/core/config/widgets/custom_body_error.dart';
import 'package:taskora/features/auth/presentation/bloc/auth/auth_state.dart';

import '../core/map/error_view_data_mapper.dart';

class BodyErrorView extends StatelessWidget {
  const BodyErrorView({super.key, this.message, this.status, this.errors});

  final String? message;
  final List<String>? errors;
  final AuthStatus? status;

  @override
  Widget build(BuildContext context) {
    final errorData = ErrorViewDataMapper.map(status: status);

    return Scaffold(
      body: CustomBodyError(
        image: errorData.imagePath,
        title: errorData.title,
        subTitle: message!,
        errorData: errors!.first,
        textButton: errorData.primaryButtonText,
        textButtonOutline: errorData.secondaryButtonText,
        onPressed: context.pop,
        onPressedOutline: () {},
      ),
    );
  }
}
