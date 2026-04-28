import 'package:flutter/material.dart';

import '../config/constants/app_sizes.dart';

extension SizesExtension on BuildContext {
  EdgeInsets get paddingScaffold =>
      const EdgeInsets.only(right: 20, left: 20, top: 10);

  SizedBox get sizedBoxHeight_10 =>
      const SizedBox(height: AppSizes.spaceSmall_10);

  SizedBox get sizedBoxHeight_14 =>
      const SizedBox(height: AppSizes.spaceSmall_14);

  SizedBox get sizedBoxHeight_16 =>
      const SizedBox(height: AppSizes.spaceMedium_16);

  SizedBox get sizedBoxHeight_8 =>
      const SizedBox(height: AppSizes.spaceSmall_8);

  SizedBox get sizedBoxHeight_4 =>
      const SizedBox(height: AppSizes.spaceSmall_4);

  SizedBox get sizedBoxHeight_36 =>
      const SizedBox(height: AppSizes.spaceLarge_36);

  SizedBox get sizedBoxHeight_60 =>
      const SizedBox(height: AppSizes.spaceLarge_60);

  SizedBox get sizedBoxHeight_22 =>
      const SizedBox(height: AppSizes.spaceMedium_22);
}
