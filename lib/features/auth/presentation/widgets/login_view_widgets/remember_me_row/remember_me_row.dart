import 'package:flutter/material.dart';
import 'package:taskora/core/config/constants/app_strings.dart';
import 'package:taskora/core/config/constants/color_manager.dart';
import 'package:taskora/core/extensions/text_style_extension.dart';
import 'package:taskora/features/auth/presentation/widgets/login_view_widgets/remember_me_row/remember_checkbox.dart';

class RememberMeRow extends StatelessWidget {
  const RememberMeRow({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final bool value;
  final ValueChanged<bool> onChanged;

  static const double _boxSize = 12;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () => onChanged(!value),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            RememberCheckBox(value: value, onTap: () => onChanged(!value)),
            const SizedBox(width: 10),
            Text(
              AppStrings.formRememberMe,
              style: context.medium.copyWith(color: ColorManager.textDarkColor),
            ),
          ],
        ),
      ),
    );
  }
}
