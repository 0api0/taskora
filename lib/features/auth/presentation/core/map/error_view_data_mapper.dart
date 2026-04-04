import 'package:taskora/core/config/constants/app_strings.dart';
import 'package:taskora/core/config/constants/image_path.dart';
import 'package:taskora/features/auth/presentation/bloc/auth/auth_state.dart';

import '../model/error_view_data.dart';

class ErrorViewDataMapper {
  static ErrorViewData map({required AuthStatus? status}) {
    switch (status) {
      case AuthStatus.networkFailure:
        return const ErrorViewData(
          imagePath: ImagePath.internetError,
          title: AppStrings.messgaesNoInternetConnection,
          primaryButtonText: AppStrings.buttonRetry,
          secondaryButtonText: AppStrings.buttonGoToSetting,
        );

      default:
        return const ErrorViewData(
          imagePath: ImagePath.serverError,
          title: AppStrings.messgaesSomethingWentWrong,
          primaryButtonText: AppStrings.buttonTryAgain,
          secondaryButtonText: AppStrings.buttonContactSupport,
        );
    }
  }
}
