import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../core/utils/consts.dart';

extension TextStyleExtension on BuildContext {
  TextStyle textStyleSmall({bool isNumer = false}) => TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      wordSpacing: 1.2,
      height: 1,
      fontFamily: locale.languageCode == 'en' || isNumer
          ? AppConstants.englishFontFamily
          : AppConstants.arabicFontFamily,
      color: Theme.of(this).textTheme.bodyMedium?.color ?? Colors.black);
  TextStyle textStyleThin({bool isNumer = false}) => TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      wordSpacing: 1.2,
      height: 1,
      fontFamily: locale.languageCode == 'en' || isNumer
          ? AppConstants.englishFontFamily
          : AppConstants.arabicFontFamily,
      color: Theme.of(this).textTheme.bodyMedium?.color ?? Colors.black);
  TextStyle textStyleRegular({bool isNumer = false}) {
    log('message::: ${isNumer}');
    return TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        wordSpacing: 1.2,
        height: 1,
        locale: Locale('en'),
        fontFamily: locale.languageCode == 'en' || isNumer
            ? AppConstants.englishFontFamily
            : AppConstants.arabicFontFamily,
        color: Theme.of(this).textTheme.bodyMedium?.color ?? Colors.black);
  }

  TextStyle textStyleSemiBold({bool isNumer = false}) => TextStyle(
      fontWeight: FontWeight.w700,
      height: 1,
      fontSize: 18,
      fontFamily: locale.languageCode == 'en' || isNumer
          ? AppConstants.englishFontFamily
          : AppConstants.arabicFontFamily,
      color: Theme.of(this).textTheme.bodyMedium?.color ?? Colors.black);
  TextStyle textStyleBold({bool isNumer = false}) => TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w800,
      fontFamily: locale.languageCode == 'en' || isNumer
          ? AppConstants.englishFontFamily
          : AppConstants.arabicFontFamily,
      color: Theme.of(this).textTheme.bodyMedium?.color ?? Colors.black);
  TextStyle textStyleExtraBold({bool isNumer = false}) => TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.w900,
      fontFamily: locale.languageCode == 'en' || isNumer
          ? AppConstants.englishFontFamily
          : AppConstants.arabicFontFamily,
      color: Theme.of(this).textTheme.bodyMedium?.color ?? Colors.black);
}
