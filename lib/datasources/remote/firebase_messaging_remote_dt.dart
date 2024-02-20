import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FirebaseMessagingRemoteData {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  final flutterLocalNotificationPlugin = FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('petir_mhz');

    final initializationSettingsIOS = DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
        onDidReceiveLocalNotification:
            (int id, String? title, String? body, String? payload) async {});

    final initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await flutterLocalNotificationPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse:
            (NotificationResponse notificationResponse) async {});

    final fcmToken = await _firebaseMessaging.getToken();

    print('Token is : $fcmToken');

    FirebaseMessaging.instance.getInitialMessage();
    FirebaseMessaging.onMessage.listen((msg) {
      print(msg.notification!.title);
      print(msg.notification!.title);
    });

    FirebaseMessaging.onMessage.listen(firebaseBackgroundHandler);
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(firebaseBackgroundHandler);
  }

  Future showNotification(
      {int id = 0, String? title, String? body, String? payload}) async {
    await flutterLocalNotificationPlugin.show(
        id,
        title,
        body,
        const NotificationDetails(
          android: AndroidNotificationDetails(
              'com.example.flt_warungol_fic12', 'app',
              importance: Importance.max),
          iOS: DarwinNotificationDetails(),
        ));
  }

  Future<void> firebaseBackgroundHandler(RemoteMessage message) async {
    showNotification(
      title: message.notification!.title,
      body: message.notification!.body,
    );
  }
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();

  await FirebaseMessagingRemoteData().firebaseBackgroundHandler(message);
}
