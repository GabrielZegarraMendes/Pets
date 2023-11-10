import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> onBackgroundMessage(RemoteMessage message) async {
  if (message.data.containsKey('data')) {
    final data = message.data['data'];
  }
  if (message.data.containsKey('notification')) {
    final notification = message.data['notification'];
  }
}

class FCM {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  var streamCtlr;
  String? titleCtlr = '';
  String? bodyCtlr = '';
  var imageCtlr;

  setNotifications() async {
    FirebaseMessaging.onBackgroundMessage(onBackgroundMessage);
    FirebaseMessaging.onMessage.listen(
      (message) async {
        titleCtlr = message.notification!.title!;
        bodyCtlr = message.notification!.body!;
        imageCtlr = Platform.isIOS && message.notification!.apple != null
            ? message.notification!.apple!.imageUrl
            : message.notification!.android!.imageUrl;
        },
    );
  }

  Future<String?> getToken() async {
    return await messaging.getToken();
  }

  dispose() {
    streamCtlr.close();
  }
}
