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
    apiKey: 'AIzaSyAbVjcnFR8YvvJnkb8ol_Z8Rtt-K_HJxXs',
    appId: '1:363661621045:web:49f30ba1ffa35ddf55fe7c',
    messagingSenderId: '363661621045',
    projectId: 'stockcalci-d5e5e',
    authDomain: 'stockcalci-d5e5e.firebaseapp.com',
    storageBucket: 'stockcalci-d5e5e.appspot.com',
    measurementId: 'G-PQZSCY0XYH',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCJG4ByVNe-j37jbP3eE4tbCBu0iI7-zes',
    appId: '1:363661621045:android:183f94117b359fff55fe7c',
    messagingSenderId: '363661621045',
    projectId: 'stockcalci-d5e5e',
    storageBucket: 'stockcalci-d5e5e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDENhk07EndzckrY50DdH1hKpgOi6cPrTo',
    appId: '1:363661621045:ios:d6a61be95f2b302155fe7c',
    messagingSenderId: '363661621045',
    projectId: 'stockcalci-d5e5e',
    storageBucket: 'stockcalci-d5e5e.appspot.com',
    iosBundleId: 'com.example.stockCalculator',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDENhk07EndzckrY50DdH1hKpgOi6cPrTo',
    appId: '1:363661621045:ios:d6a61be95f2b302155fe7c',
    messagingSenderId: '363661621045',
    projectId: 'stockcalci-d5e5e',
    storageBucket: 'stockcalci-d5e5e.appspot.com',
    iosBundleId: 'com.example.stockCalculator',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAbVjcnFR8YvvJnkb8ol_Z8Rtt-K_HJxXs',
    appId: '1:363661621045:web:0d257118c946caab55fe7c',
    messagingSenderId: '363661621045',
    projectId: 'stockcalci-d5e5e',
    authDomain: 'stockcalci-d5e5e.firebaseapp.com',
    storageBucket: 'stockcalci-d5e5e.appspot.com',
    measurementId: 'G-5SVXQEQPM9',
  );
}