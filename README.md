
# Common Setup package

This package is for personal use to reduce initialization time in new apps.




## Installation

🔩 Installation #


Add to your pubspec.yaml:

```bash
  dependencies:
    ...
    common_setup:
        git:
        url: https://github.com/ALRASHIDI-D/setup_package.git
        ref: main
    ...
```

## Environment Variables

To run this project, you will need to add the following environment variables to your .env file

`BASE_URL_STAGING`

`BASE_URL_PRODUCTION`

`SENTRY_DSN`


## ⚙️ Configuration Steps

- [Create App Flavors](https://awesomeopensource.com/project/elangosundar/awesome-README-templates)

- [Create sentry new project for app to can monitoring requests](http://sentry.io) 

- [Call 'initialApp' in your main program's configuration section to set up your application.](#)




## Usage/Examples

```flutter
import 'package:common_setup/dependency_injection.dart' as setup_injection;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  // Please use the initial app to parse variables for your project.
  
  CommonSetup().initialApp(CustomizeAppEntity(
      stagingBaseUrl: '',
      prodBaseUrl: '',
      primaryColor: Colors.black,
      secondColor: Colors.yellow,
      appUseToken: false,
      defualtPadding: 10,
      defualtRadius: 15,
      tokenKeyUsedInApp: '',
      sentryProjectUrl: ''));
  runApp(EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: const MyApp()));
}
```


## Deployment

To build app in debug mode

```bash
  flutter run --flavor staging -t lib/main_staging.dart
```

To create apk with obfuscate

```bash
  flutter build apk --flavor staging -t lib/main_staging.dart --obfuscate --split-debug-info=<your path>
```
## Authors

- [@ mahmoud alrashidi](https://www.github.com/alrashidi7)

