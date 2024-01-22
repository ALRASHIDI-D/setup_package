import 'package:flutter/material.dart';

class CustomizeAppEntity {
  final String stagingBaseUrl;
  final String prodBaseUrl;
  final Color primaryColor;
  final Color secondColor;
  final bool? appUseToken;
  final String? tokenKeyUsedInApp;
  final num? defualtPadding;
  final num? defualtRadius;

  CustomizeAppEntity(
      {required this.stagingBaseUrl,
      required this.prodBaseUrl,
      required this.primaryColor,
      required this.secondColor,
      required this.appUseToken,
      required this.tokenKeyUsedInApp,
      required this.defualtPadding,
      required this.defualtRadius});
}
