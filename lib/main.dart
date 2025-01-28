import 'package:drosak/firebase_options.dart';
import 'package:drosak/src/app/my_app.dart';
import 'package:drosak/src/core/resources/routes_mananger.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'dart:io';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String routname = await checkWhichScreen();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp(
    routesName: routname,
  ));
}
Future<String> checkWhichScreen() async {
  String? androidVersion = await getAndroidVersion();
  if (androidVersion != null) {
    if (int.parse(androidVersion) >= 12) {
      // go to custom splash screen
      return RoutesName.kSplashScreenRoute;
    }
  }
  return RoutesName.kOnBoardingScreenRoute;
}

Future<String?> getAndroidVersion() async {
  if (Platform.isAndroid) {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    return androidInfo.version.release;
  }
  return null;
}



