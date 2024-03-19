import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTab,
    required this.subtitleTextStyle,
  });
  final String title, subtitle;
  final TextStyle subtitleTextStyle;

  final VoidCallback onTab;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: title,
          style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.kWhite)
              .copyWith(
                  color: AppColors.kWhite,
                  fontWeight: FontWeight.w600,
                  fontSize: 14),
          children: <TextSpan>[
            TextSpan(
              text: subtitle,
              style: subtitleTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
