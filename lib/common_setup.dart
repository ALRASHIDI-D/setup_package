library common_setup;

import 'core/utils/entities/customize_app_entity.dart';
import 'dependency_injection.dart' as di;

class CommonSetup {
  initialApp(CustomizeAppEntity appEntity) async {
    await di.init(appEntity);
  }
}
