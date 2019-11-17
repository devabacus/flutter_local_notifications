import 'package:flutter_local_notifications/flutter_local_notifications.dart';


NotificationDetails get _ongoing {
  final androidChannelSpecifics = AndroidNotificationDetails(
    'your channel id',
    'your channel name',
    'your channel description',
    importance: Importance.Max,
    priority: Priority.High,
    ongoing: true,
    autoCancel: false,
    playSound: true,
    enableVibration: true,
    channelAction:
  );
  final iosChannelSpecifics = IOSNotificationDetails();
  return NotificationDetails(androidChannelSpecifics, iosChannelSpecifics);
}




Future showOnGoingNotification(
    FlutterLocalNotificationsPlugin notifications, {
      String title,
      String body,
      int id = 0,
    }) => _showNotification(notifications, id : id, title: title, body: body, type: _ongoing);


Future _showNotification(
  FlutterLocalNotificationsPlugin notifications, {
  String title,
  String body,
  NotificationDetails type,
  int id = 0,
}) => notifications.show(id, title, body, type);

