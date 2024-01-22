import 'package:common_setup/core/utils/entities/customize_app_entity.dart';
import 'package:common_setup/dependency_injection.dart'
    as setup_package_injection;

class AppConstants {
  static String tokenKeyForLocalStorage = "token_key";
  static String tokenKeyForAuthorizationHeader =
      setup_package_injection.sl<CustomizeAppEntity>().tokenKeyUsedInApp ?? '';

  static num defualtPadding =
      setup_package_injection.sl<CustomizeAppEntity>().defualtPadding ?? 0.0;
  static num defualtRadius =
      setup_package_injection.sl<CustomizeAppEntity>().defualtRadius ?? 0.0;

  static String arabicFontFamily = 'GE_Flow_Regular';

  static String englishFontFamily = 'Lato';
}

enum TokenTypes { bearer, basic }
