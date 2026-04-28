import 'package:taskora/core/config/constants/app_strings.dart';
import 'package:taskora/core/config/constants/image_path.dart';

import '../model/error_view_data.dart';

enum ErrorViewType { network, general }

class ErrorViewDataMapper {
  static ErrorViewData map({ErrorViewType? errorViewType}) {
    switch (errorViewType) {
      case ErrorViewType.network:
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
