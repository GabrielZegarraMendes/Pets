import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:package_info_plus/package_info_plus.dart';

enum Flavor { dev, qa, hml, prod }

class AppConfig extends InheritedWidget {
  final Flavor? flavors;

  AppConfig({
    Key? key,
    required this.flavors,
    required Widget? child,
  }) : super(key: key, child: child!);

  String get title {
    switch (flavors) {
      case Flavor.prod:
        return 'App Name [PROD]';
      case Flavor.hml:
        return 'App Name [HML]';
      case Flavor.qa:
        return 'App Name [QA]';
      case Flavor.dev:
      default:
        return 'App Name [DEV]';
    }
  }

  static AppConfig of(dynamic context) {
    return context.dependOnInheritedWidgetOfExactType<AppConfig>();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;

  static Future<Flavor> initEnvironment() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();

    switch (packageInfo.packageName) {
      case 'br.com.work.dev':
        await dotenv.load(fileName: '.env-dev');
        return Flavor.dev;
      case 'br.com.work.qa':
        await dotenv.load(fileName: '.env-qa');
        return Flavor.qa;
      case 'br.com.work.hml':
        await dotenv.load(fileName: '.env-hml');
        return Flavor.hml;
      case 'br.com.work':
        await dotenv.load(fileName: '.env');
        return Flavor.prod;
      default:
        await dotenv.load(fileName: '.env-dev');
        return Flavor.dev;
    }
  }
}
