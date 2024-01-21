import 'package:flutter/material.dart';

class CustomizeApp {
  final String stagingBaseUrl;
  final String prodBaseUrl;
  final Color primaryColor;
  final Color secondColor;
  final bool appUseToken;
  final String tokenKeyUsedInApp;

  CustomizeApp(
      {required this.stagingBaseUrl,
      required this.prodBaseUrl,
      required this.primaryColor,
      required this.secondColor,
      this.tokenKeyUsedInApp = "Authorization",
      this.appUseToken = true});
}
