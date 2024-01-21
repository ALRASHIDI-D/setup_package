import 'package:flutter/material.dart';

class CustomizeApp {
  final String stagingBaseUrl;
  final String prodBaseUrl;
  final Color primaryColor;
  final Color secondColor;
  final bool? appUseToken;
  final String? tokenKeyUsedInApp;
  final num? defualtPadding;
  final num? defualtRadius;

  CustomizeApp(
      {required this.stagingBaseUrl,
      required this.prodBaseUrl,
      required this.primaryColor,
      required this.secondColor,
      required this.defualtPadding,
      required this.defualtRadius,
      this.tokenKeyUsedInApp = "Authorization",
      this.appUseToken = true});
}
