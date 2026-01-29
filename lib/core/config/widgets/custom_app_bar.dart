import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taskora/core/config/constants/icon_path.dart';
import 'package:taskora/core/extensions/text_style_extension.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title, this.showIcon = true});

  final String title;
  final bool? showIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: SizedBox(
        height: 30,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: [
            showIcon!
                ? Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: SvgPicture.asset(
                        IconPath.arrowBackLeft,
                        width: 24,
                        height: 24,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  )
                : const SizedBox(),
            Text(title, style: context.bold),
          ],
        ),
      ),
    );
  }
}
