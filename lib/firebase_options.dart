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
    apiKey: 'AIzaSyDNgZILn5xgf4t8DUHiqiIEo4qf1cHgYM0',
    appId: '1:235499332635:web:141aea282fe205fcf444be',
    messagingSenderId: '235499332635',
    projectId: 'to-do-list-cebc2',
    authDomain: 'to-do-list-cebc2.firebaseapp.com',
    storageBucket: 'to-do-list-cebc2.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAYduNzE6eT24qTZbEZgi1FuYkiXe6ynmM',
    appId: '1:235499332635:android:b9f2362a42b5f8a2f444be',
    messagingSenderId: '235499332635',
    projectId: 'to-do-list-cebc2',
    storageBucket: 'to-do-list-cebc2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD_ezhc1-ckqD0KaLPouIZv0x0ZIx59Esg',
    appId: '1:235499332635:ios:63b4d26fdb3057bff444be',
    messagingSenderId: '235499332635',
    projectId: 'to-do-list-cebc2',
    storageBucket: 'to-do-list-cebc2.appspot.com',
    iosClientId: '235499332635-tlhp6jpo38mtt67m55n1nmsl02f8hs8g.apps.googleusercontent.com',
    iosBundleId: 'com.example.tp3',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD_ezhc1-ckqD0KaLPouIZv0x0ZIx59Esg',
    appId: '1:235499332635:ios:732e25df8f89a19df444be',
    messagingSenderId: '235499332635',
    projectId: 'to-do-list-cebc2',
    storageBucket: 'to-do-list-cebc2.appspot.com',
    iosClientId: '235499332635-5l97ur5ns1v59o0cbm54214ai7s6le3u.apps.googleusercontent.com',
    iosBundleId: 'com.example.tp3.RunnerTests',
  );
}
