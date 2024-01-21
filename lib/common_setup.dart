library common_setup;

import 'package:common_setup/core/utils/entities/customize_app_entity.dart';
import 'package:flutter/material.dart';

import 'dependency_injection.dart' as di;

class CommonSetup {
  initialApp() async {
    final CustomizeAppEntity customAppEntity = CustomizeAppEntity(
        stagingBaseUrl: 'staging',
        prodBaseUrl: "prod",
        primaryColor: Colors.blueGrey,
        secondColor: Colors.yellow,
        appUseToken: true,
        tokenKeyUsedInApp: '');
    await di.init(customAppEntity);
  }
}
