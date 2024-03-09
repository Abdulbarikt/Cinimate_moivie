import 'package:flutter/material.dart';

class AppColors {
  static const Color kPrimary = Color(0xFF32A873);
  static Color kBackGroundColor = const Color(0XFF2D3047);
  static Color kGrayscaleDark100 = const Color(0XFF1C1C1E);
  static Color kBackground = const Color(0XFFFAFAFA);
  static Color kBackground2 = const Color(0XFFF6F6F6);
  static Color kGrayscale40 = const Color(0XFFAEAEB2);
  static Color kLightAccentColor = const Color(0XFFF4E5F7);
  static Color kLine = const Color(0XFFEBEBEB);

  static Color kGreyColor = const Color(0XFF939999);
  static Color kSamiDarkColor = const Color(0XFF313333);
  static Color kBlackColor = const Color(0XFF000000);
  static Color kWhiteColor = const Color(0XFFFFFFFF);
  static const Color kWhite = Color(0xFFFEFEFE);
  static LinearGradient customOnboardingGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      const Color(0xFF110C1D).withOpacity(0.0),
      const Color(0xFF110C1D),
    ],
  );
}
