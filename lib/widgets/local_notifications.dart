import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_notifications/notification_helper.dart';
import 'package:flutter_notifications/page/second_page.dart';

class LocalNotificationWidget extends StatefulWidget {
  @override
  _LocalNotificationWidgetState createState() =>
      _LocalNotificationWidgetState();
}

class _LocalNotificationWidgetState extends State<LocalNotificationWidget> {
  FlutterLocalNotificationsPlugin notification =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    final initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');

    final initializationSettingsIOS = IOSInitializationSettings(
        onDidReceiveLocalNotification: (id, title, body, payload) =>
            onSelectNotification(payload));
    final initializationSettings = InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);

    notification.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
  }

  Future onSelectNotification(String payload) async {
    if (payload != null) {
      debugPrint('notification payload: ' + payload);
    }
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SecondScreen(payload: payload)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RaisedButton(
          child: Text('show notification'),
          onPressed: () => showOnGoingNotification(notification,
              title: 'title', body: 'body'),
        ),
        RaisedButton(
          child: Text('chanee notification'),
          onPressed: () => showOnGoingNotification(notification,
              title: 'title1', body: 'body1'),
        ),
        RaisedButton(
          child: Text('show notification'),
          onPressed: () => showOnGoingNotification(notification,
              title: 'title', body: 'body', id: 1),
        ),
        RaisedButton(
          child: Text("cancel all notifications"),
          onPressed: () => notification.cancelAll(),
        )
      ],
    );
  }
}
