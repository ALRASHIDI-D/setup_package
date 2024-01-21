import 'package:flutter/material.dart';

class InitialAppEntity {
  final String stagingBaseUrl;
  final String prodBaseUrl;
  final Color primaryColor;
  final Color secondColor;
  final bool appUseToken;
  final String tokenKeyUsedInApp;

  InitialAppEntity(
      {required this.stagingBaseUrl,
      required this.prodBaseUrl,
      required this.primaryColor,
      required this.secondColor,
      required this.appUseToken,
      required this.tokenKeyUsedInApp});
}
