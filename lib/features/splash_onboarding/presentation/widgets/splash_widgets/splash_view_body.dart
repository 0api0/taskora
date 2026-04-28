import 'package:flutter/material.dart';
import 'package:taskora/core/config/constants/app_sizes.dart';
import 'package:taskora/core/config/constants/app_strings.dart';
import 'package:taskora/core/config/constants/image_path.dart';
import 'package:taskora/core/extensions/text_style_extension.dart';
import 'package:taskora/features/splash_onboarding/presentation/widgets/splash_widgets/shimmer.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Shimmer(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              ImagePath.logo,
              width: AppSizes.widthLogo,
              height: AppSizes.heightLogo,
              fit: BoxFit.contain,
            ),
            Transform.translate(
              offset: const Offset(0, -22),
              child: Text(AppStrings.appName, style: context.extraBold),
            ),
          ],
        ),
      ),
    );
  }
}
