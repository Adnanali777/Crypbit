import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final NotificationService _notificationService =
      NotificationService._internal();

  factory NotificationService() {
    return _notificationService;
  }

  NotificationService._internal();

  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future initialize(String title, String body) async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings("app_icon");

    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: androidInitializationSettings,
    );

    Future selectNotifications(String payload) async {
      //handle actions here
    }

    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: selectNotifications);

    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails("0", "channel", "Description",
            importance: Importance.high, priority: Priority.high);

    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    Future shownotifications() async {
      await _flutterLocalNotificationsPlugin
          .show(0, title, body, platformChannelSpecifics, payload: 'data');
    }

    shownotifications();
  }
}
