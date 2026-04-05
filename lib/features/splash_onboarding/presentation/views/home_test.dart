import 'package:flutter/material.dart';
import 'package:taskora/core/extensions/text_style_extension.dart';

import '../../../../core/di/service_locator.dart';
import '../../../auth/data/datasources/local/auth_local_data_source.dart';
import '../../../auth/domain/repositories/auth_session_manager_store.dart';

class HomeTest extends StatelessWidget {
  const HomeTest({super.key});

  @override
  Widget build(BuildContext context) {
    final String? token =
        sl<AuthSessionStore>().token ?? sl<AuthLocalDataSource>().getToken();

    return Scaffold(
      body: Center(
        child: Text(
          'Home test , ${token ?? 'No token'}',
          style: context.extraBold,
        ),
      ),
    );
  }
}
