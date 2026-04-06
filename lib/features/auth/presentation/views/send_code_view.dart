import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskora/features/auth/presentation/bloc/password_recovery/password_recovery_bloc.dart';

import '../../../../core/di/service_locator.dart';
import '../widgets/send_code_widgets/send_code_view_body.dart';

class SendCodeView extends StatelessWidget {
  const SendCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: const Scaffold(
        resizeToAvoidBottomInset: true,
        body: SendCodeViewBody(),
      ),
    );
  }
}
