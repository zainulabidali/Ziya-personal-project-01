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
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDKzklYxMwRnGOmfcjDoptxq-QPdI7r6qY',
    appId: '1:141241288608:web:02370301c46311abce86c5',
    messagingSenderId: '141241288608',
    projectId: 'ziya-attend-app',
    authDomain: 'ziya-attend-app.firebaseapp.com',
    storageBucket: 'ziya-attend-app.firebasestorage.app',
    measurementId: 'G-PRR4Q2RX76',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCgOGK6q5qfKsVte3zlE9cIUHWrFMIJhSI',
    appId: '1:141241288608:android:47d0237315ea2109ce86c5',
    messagingSenderId: '141241288608',
    projectId: 'ziya-attend-app',
    storageBucket: 'ziya-attend-app.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB1ZHZETaGUZpc0N5Rd2q3RHdBJusI2SQA',
    appId: '1:141241288608:ios:28c169530c5202f7ce86c5',
    messagingSenderId: '141241288608',
    projectId: 'ziya-attend-app',
    storageBucket: 'ziya-attend-app.firebasestorage.app',
    iosBundleId: 'com.example.personalApp',
  );
}
