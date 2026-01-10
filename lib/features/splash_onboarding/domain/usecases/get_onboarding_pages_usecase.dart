import 'package:taskora/core/config/constants/app_strings.dart';

import '../../../../core/config/constants/image_path.dart';
import '../entities/onboarding_page_entity.dart';

class GetOnboardingPagesUseCase {
  const GetOnboardingPagesUseCase();

  List<OnboardingPageEntity> call() {
    return const [
      OnboardingPageEntity(
        title: AppStrings.onboardingView1Title,
        description: AppStrings.onboardingView1SubTitle,
        imagePath: ImagePath.onBoarding_1,
      ),
      OnboardingPageEntity(
        title: AppStrings.onboardingView2Title,
        description: AppStrings.onboardingView2SubTitle,
        imagePath: ImagePath.onBoarding_2,
      ),
      OnboardingPageEntity(
        title: AppStrings.onboardingView1Title,
        description: AppStrings.onboardingView1SubTitle,
        imagePath: ImagePath.onBoarding_3,
      ),
    ];
  }
}
