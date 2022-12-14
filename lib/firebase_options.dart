// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyB5VitoF-ilVrib7ptrp7ghxiV8VIpTxkM',
    appId: '1:922862604611:web:51fd473f05a92260f71ff6',
    messagingSenderId: '922862604611',
    projectId: 'myapp-camila',
    authDomain: 'myapp-camila.firebaseapp.com',
    storageBucket: 'myapp-camila.appspot.com',
    measurementId: 'G-2L5RL03MJ2',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC1oVuBJBIdhU8wxqC2mbnCLY0-pDEzGgE',
    appId: '1:922862604611:android:37beb34f19fed7a0f71ff6',
    messagingSenderId: '922862604611',
    projectId: 'myapp-camila',
    storageBucket: 'myapp-camila.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBnDPjdb4XwgZTl80cRRcyISMQ_8Cf-4bY',
    appId: '1:922862604611:ios:93535ef55d40a6cff71ff6',
    messagingSenderId: '922862604611',
    projectId: 'myapp-camila',
    storageBucket: 'myapp-camila.appspot.com',
    iosClientId: '922862604611-p3mri7qfudfqb8vlctjqilhnn6cppctl.apps.googleusercontent.com',
    iosBundleId: 'com.example.teste4',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBnDPjdb4XwgZTl80cRRcyISMQ_8Cf-4bY',
    appId: '1:922862604611:ios:93535ef55d40a6cff71ff6',
    messagingSenderId: '922862604611',
    projectId: 'myapp-camila',
    storageBucket: 'myapp-camila.appspot.com',
    iosClientId: '922862604611-p3mri7qfudfqb8vlctjqilhnn6cppctl.apps.googleusercontent.com',
    iosBundleId: 'com.example.teste4',
  );
}
