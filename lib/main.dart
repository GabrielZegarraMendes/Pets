import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:works_app/firebase_options.dart';
import 'package:works_app/src/app/app_module.dart';
import 'package:works_app/src/app/app_widget.dart';
import 'package:works_app/src/core/firebase/external/firebase_config.dart';

import 'app_config.dart';

bool shouldUseFirestoreEmulator = true;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseFirestore.instance.settings =
      const Settings(cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);

  final firebaseMessaging = FCM();
  firebaseMessaging.setNotifications();

  var configuredApp = AppConfig(
    flavors: await AppConfig.initEnvironment(),
    child: ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );

  runApp(configuredApp);
}
