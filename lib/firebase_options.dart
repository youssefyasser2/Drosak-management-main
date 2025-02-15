// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAJpiu1lS3YWgHYbWvz5qNm54pAPH8hgp0',
    appId: '1:315818859363:android:1641b1ffa2a570d9259156',
    messagingSenderId: '315818859363',
    projectId: 'myfirebaseprojext007-c11c4',
    storageBucket: 'myfirebaseprojext007-c11c4.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBMEJqFlIt00W0oPfX9TiSUqolbkqMpSRw',
    appId: '1:315818859363:ios:3133b0d20923b657259156',
    messagingSenderId: '315818859363',
    projectId: 'myfirebaseprojext007-c11c4',
    storageBucket: 'myfirebaseprojext007-c11c4.firebasestorage.app',
    iosBundleId: 'com.youssef.drosak',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBMEJqFlIt00W0oPfX9TiSUqolbkqMpSRw',
    appId: '1:315818859363:ios:3133b0d20923b657259156',
    messagingSenderId: '315818859363',
    projectId: 'myfirebaseprojext007-c11c4',
    storageBucket: 'myfirebaseprojext007-c11c4.firebasestorage.app',
    iosBundleId: 'com.youssef.drosak',
  );

}