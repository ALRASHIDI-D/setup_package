library common_setup;

import 'package:common_setup/core/utils/entities/initial_app_entity.dart';

import 'core/utils/customize_app.dart';
import 'dependency_injection.dart' as di;

class CommonSetup {
  initialApp(CustomizeApp appEntity) async {
    await di.init(appEntity);
  }
}
