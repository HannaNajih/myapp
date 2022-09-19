import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myapp/firebase_options.dart';
import 'package:myapp/src/auth_screens/signin.dart';
import 'package:myapp/src/auth_screens/signup.dart';
import 'package:myapp/src/onboardingpages.dart';
import 'package:myapp/src/pages/add_task_page.dart';
//import 'package:myapp/src/services/notification_sevices.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // ignore: unused_local_variabl
  // final NotifyHelper notifyHelper = NotifyHelper();
  // await NotifyHelper().initializeNotifications();
  // await notifyHelper.requestIOSPermission();
  //android pewesty ba dawakrdne permission nia boia hich configurationy nawet
  // await notifyHelper.initializeNotifications();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const OnBoardingScreen());
}
