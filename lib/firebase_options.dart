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
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyBaIlCUmZGl9uan6Gb-6M2FZPy5zWbS778',
    appId: '1:586866969347:web:4006b27f040d601d133736',
    messagingSenderId: '586866969347',
    projectId: 'scholarship-96680',
    authDomain: 'scholarship-96680.firebaseapp.com',
    databaseURL: 'https://scholarship-96680-default-rtdb.firebaseio.com',
    storageBucket: 'scholarship-96680.firebasestorage.app',
    measurementId: 'G-9T74W0FLGB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB7bqxPUHXSBhfj5-NyweAswZym137aN7E',
    appId: '1:586866969347:android:8de076cb13d6efa9133736',
    messagingSenderId: '586866969347',
    projectId: 'scholarship-96680',
    databaseURL: 'https://scholarship-96680-default-rtdb.firebaseio.com',
    storageBucket: 'scholarship-96680.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyADzvB1iJhDwTyfa-JPnF0Mwpl0O8xZ-Vc',
    appId: '1:586866969347:ios:5acf4d236d7a6aa0133736',
    messagingSenderId: '586866969347',
    projectId: 'scholarship-96680',
    databaseURL: 'https://scholarship-96680-default-rtdb.firebaseio.com',
    storageBucket: 'scholarship-96680.firebasestorage.app',
    iosBundleId: 'com.scholarship.app',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyADzvB1iJhDwTyfa-JPnF0Mwpl0O8xZ-Vc',
    appId: '1:586866969347:ios:1141b1097f6a7634133736',
    messagingSenderId: '586866969347',
    projectId: 'scholarship-96680',
    databaseURL: 'https://scholarship-96680-default-rtdb.firebaseio.com',
    storageBucket: 'scholarship-96680.firebasestorage.app',
    iosBundleId: 'com.example.untitled1',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBaIlCUmZGl9uan6Gb-6M2FZPy5zWbS778',
    appId: '1:586866969347:web:4735583bf6655f67133736',
    messagingSenderId: '586866969347',
    projectId: 'scholarship-96680',
    authDomain: 'scholarship-96680.firebaseapp.com',
    databaseURL: 'https://scholarship-96680-default-rtdb.firebaseio.com',
    storageBucket: 'scholarship-96680.firebasestorage.app',
    measurementId: 'G-NN4LRBL5GD',
  );

}