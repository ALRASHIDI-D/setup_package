import 'dart:ui';

class CustomizeAppEntity {
  final String stagingBaseUrl;
  final String prodBaseUrl;
  final bool? appUseToken;
  final String? tokenKeyUsedInApp;
  final Color primaryColor;
  final Color secondColor;

  CustomizeAppEntity({
    required this.stagingBaseUrl,
    required this.prodBaseUrl,
    required this.primaryColor,
    required this.secondColor,
    this.appUseToken,
    this.tokenKeyUsedInApp,
  });
}
