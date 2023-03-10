import 'package:flutter/material.dart';
import 'package:flutter_pet_app/constants/constant_exports.dart';

class FontConstants {
  static const TextTheme onboardingTexts = TextTheme(
    titleLarge: TextStyle(
      fontFamily: 'poppins_bold',
      fontSize: 24,
    ),
    titleSmall: TextStyle(
      fontFamily: 'poppins_regular',
      fontSize: 14,
      color: ColorConstants.darkGrey,
    ),
  );

  static const TextTheme authTexts = TextTheme(
    titleLarge: TextStyle(
      fontFamily: 'poppins_bold',
      fontSize: 24,
    ),
    titleSmall: TextStyle(
      fontFamily: 'poppins_regular',
      fontSize: 14,
      color: ColorConstants.darkGrey,
    ),
    labelSmall: TextStyle(
      fontFamily: 'poppins_regular',
      fontSize: 16,
      color: Colors.white,
    ),
  );

  static const TextTheme commonText = TextTheme(
    titleSmall: TextStyle(
      fontFamily: 'poppins_regular',
      fontSize: 12,
    ),
  );
}
