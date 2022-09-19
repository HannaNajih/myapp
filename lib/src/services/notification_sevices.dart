// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:get/get.dart';
// import 'package:timezone/data/latest_all.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;
// import '../pages/notification_screen.dart';

// class NotifyHelper {
//   //ama objeteka law classa
//   FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();
//   //am methoda boia drwst akain takw inialise objecty pluginy hardw jory notificationy
//   //ios w androidman bo bkat agar macOsyshman bwet boman akat
//   initializeNotifications() async {
//     //displayNotification(body: 'hhh', title: 'jjjj');
//     tz.initializeTimeZones();
//     //tz.setLocalLocation(tz.getLocation(timeZoneName));
//     //amash objecty nasandny pluginaka taybata ba android
//     final AndroidInitializationSettings initializationSettingsAndroid =
//         // ignore: prefer_const_constructors
//         AndroidInitializationSettings('appicon');

//     //amash objecty nasandny pluginaka taybata ba IOS
//     final IOSInitializationSettings initializationSettingsIOS =
//         IOSInitializationSettings(
//       requestSoundPermission: false,
//       requestBadgePermission: false,
//       requestAlertPermission: false,
//       onDidReceiveLocalNotification: onDidReceiveLocalNotification,
//     );
//     final InitializationSettings initializationSettings =
//         InitializationSettings(
//       android: initializationSettingsAndroid,
//       iOS: initializationSettingsIOS,
//     );
//     await flutterLocalNotificationsPlugin.initialize(initializationSettings,
//         onSelectNotification: (String? payload) async {
// //la naw ma functiona aw functionay xoman bang akainaw aka rabta ba classy notificationscreen
//       selectNotification(payload!);
//     });
//   }

//   requestIOSPermission() {
//     flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<
//             IOSFlutterLocalNotificationsPlugin>()
//         ?.requestPermissions(
//           sound: true,
//           alert: true,
//           badge: true,
//         );
//   }
//   //amash objecty nasandny pluginaka taybata ba MACOS
//   // final MacOSInitializationSettings initializationSettingsMacOS =
//   //     MacOSInitializationSettings(
//   //         requestAlertPermission: false,
//   //         requestBadgePermission: false,
//   //         requestSoundPermission: false);
//   //

//   void selectNotification(String payload) async {
//     // ignore: unnecessary_null_comparison
//     if (payload != null) {
//       debugPrint('notification payload: $payload');
//     }
//     await Get.to(NotificationScreen(payload: payload));
//   }

//   displayNotification({required String title, required String body}) async {
//     AndroidNotificationDetails androidPlatformChannelSpecifics =
//         const AndroidNotificationDetails(
//       'your channel id',
//       'your channel name',
//       'your channel description',
//       importance: Importance.max,
//       priority: Priority.high,
//       showWhen: false,
//     );
//     IOSNotificationDetails iosPlatformChannelSpecifics =
//         const IOSNotificationDetails();
//     NotificationDetails platformChannelSpecifics = NotificationDetails(
//         android: androidPlatformChannelSpecifics,
//         iOS: iosPlatformChannelSpecifics);
//     await flutterLocalNotificationsPlugin.show(
//         0, title, body, platformChannelSpecifics,
//         payload: 'Default_Sound');
//   }

//   ///lera aw joray notificationy tedaya ka dyary akain dway kateke dyarykraw boman bet w pshany bdat
//   scheduleNotification() async {
//     FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//         FlutterLocalNotificationsPlugin();
//     await flutterLocalNotificationsPlugin.zonedSchedule(
//         0,
//         'scheduled title',
//         'scheduled body',
//         tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
//         const NotificationDetails(
//             android: AndroidNotificationDetails('your channel id',
//                 'your channel name', 'your channel description')),
//         androidAllowWhileIdle: true,
//         uiLocalNotificationDateInterpretation:
//             UILocalNotificationDateInterpretation.absoluteTime);
//   }

//   ///for older ios
//   Future onDidReceiveLocalNotification(
//       int id, String? title, String? body, String? payload) async {
//     // labry bakar henany aw dialog a ka xoi haya la site saraki flutter
//     //ema ba GetX aykain, la konda bam shewaya bw balam rega tazaakai lasarawaya
//     //ka hamw permissionakani false man dawate
//     Get.dialog(Text(body!));
//   }
// }
