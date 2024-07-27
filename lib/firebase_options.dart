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
    apiKey: 'AIzaSyAGHWsEjyLTfcVK8GlVuFbox4Ser40EiCI',
    appId: '1:699937757793:web:9bede66b07b1720252e820',
    messagingSenderId: '699937757793',
    projectId: 'spotify-f6558',
    authDomain: 'spotify-f6558.firebaseapp.com',
    storageBucket: 'spotify-f6558.appspot.com',
    measurementId: 'G-R6V0JJ96YC',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD3W00bZTIu8o5dN-ZgexsdvZ7AEQfSoU4',
    appId: '1:699937757793:android:6bde5c607bf8735052e820',
    messagingSenderId: '699937757793',
    projectId: 'spotify-f6558',
    storageBucket: 'spotify-f6558.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDO8XqiDnSeS-3hco_l1oAsIuJEtkkPkIw',
    appId: '1:699937757793:ios:8acfd8549883155752e820',
    messagingSenderId: '699937757793',
    projectId: 'spotify-f6558',
    storageBucket: 'spotify-f6558.appspot.com',
    iosBundleId: 'com.example.spotify',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDO8XqiDnSeS-3hco_l1oAsIuJEtkkPkIw',
    appId: '1:699937757793:ios:8acfd8549883155752e820',
    messagingSenderId: '699937757793',
    projectId: 'spotify-f6558',
    storageBucket: 'spotify-f6558.appspot.com',
    iosBundleId: 'com.example.spotify',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAGHWsEjyLTfcVK8GlVuFbox4Ser40EiCI',
    appId: '1:699937757793:web:b0f6668033042bbe52e820',
    messagingSenderId: '699937757793',
    projectId: 'spotify-f6558',
    authDomain: 'spotify-f6558.firebaseapp.com',
    storageBucket: 'spotify-f6558.appspot.com',
    measurementId: 'G-3DXK1BRK8G',
  );
}
