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
    apiKey: 'AIzaSyA5cBEgzbWdsjfNE2Z4xTJ6yZ-zYqydNbA',
    appId: '1:818323670469:web:0c0d7a93f10d4fcc8637ac',
    messagingSenderId: '818323670469',
    projectId: 'socialmedia-1d511',
    authDomain: 'socialmedia-1d511.firebaseapp.com',
    storageBucket: 'socialmedia-1d511.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDQsqgI22gKExmHToC9sqP5xHLSeZq_UY0',
    appId: '1:818323670469:android:a101e80aa5d9c59b8637ac',
    messagingSenderId: '818323670469',
    projectId: 'socialmedia-1d511',
    storageBucket: 'socialmedia-1d511.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBRbRirQULF-aw9FvGJLNK67hvdEMUG5HM',
    appId: '1:818323670469:ios:2a6b5528fad3340f8637ac',
    messagingSenderId: '818323670469',
    projectId: 'socialmedia-1d511',
    storageBucket: 'socialmedia-1d511.firebasestorage.app',
    iosBundleId: 'com.example.socialmedia',
  );
}
