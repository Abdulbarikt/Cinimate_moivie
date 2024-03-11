import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class Log_Divider extends StatelessWidget {
  final String title;
  const Log_Divider({
    required this.title,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 2,
            child: Divider(
              color: AppColors.kLine,
            )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Text(
            title,
            style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.kBlackColor)
                .copyWith(
                    color: AppColors.kWhite,
                    fontWeight: FontWeight.w500,
                    fontSize: 14),
          ),
        ),
        Expanded(
            flex: 2,
            child: Divider(
              color: AppColors.kLine,
            ))
      ],
    );
  }
}
