library common_setup;

import 'package:common_setup/core/utils/entities/customize_app_entity.dart';
import 'package:common_setup/core/utils/entities/initial_app_entity.dart';

import 'dependency_injection.dart' as di;

class CommonSetup {
  initialApp(InitialAppEntity appEntity) async {
    final CustomizeAppEntity customAppEntity = CustomizeAppEntity(
        stagingBaseUrl: appEntity.stagingBaseUrl,
        prodBaseUrl: appEntity.prodBaseUrl,
        primaryColor: appEntity.primaryColor,
        secondColor: appEntity.secondColor,
        appUseToken: appEntity.appUseToken,
        tokenKeyUsedInApp: appEntity.tokenKeyUsedInApp);
    await di.init(customAppEntity);
  }
}
