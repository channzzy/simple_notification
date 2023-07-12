import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:simple_notification/notifikasi/ui/detail_page.dart';
import 'package:simple_notification/notifikasi/ui/home_page.dart';
import 'package:simple_notification/notifikasi/utils/notification_helper.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final NotificationHelper notificationHelper = NotificationHelper();

  await notificationHelper.initNotifications(flutterLocalNotificationsPlugin);
  notificationHelper.requestIOSPermissions(flutterLocalNotificationsPlugin);

  runApp(
    MaterialApp(
      initialRoute: HomePages.routeName,
      routes: {
        HomePages.routeName: (context) => const HomePages(),
        DetailPage.routeName: (context) => const DetailPage(),
      },
    ),
  );
}
