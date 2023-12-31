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
    apiKey: 'AIzaSyCqVQgs3rzxVnitSJ06iM50Kn09fVV5qj0',
    appId: '1:927237294186:web:0bb79136d913dd36022213',
    messagingSenderId: '927237294186',
    projectId: 'customerdatarecord-9ef81',
    authDomain: 'customerdatarecord-9ef81.firebaseapp.com',
    storageBucket: 'customerdatarecord-9ef81.appspot.com',
    measurementId: 'G-CVT8JG08BV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAVbggt2mVG67p3w0YE9WMKJ-KfIwm6Pys',
    appId: '1:927237294186:android:bc3c94d0dc562e25022213',
    messagingSenderId: '927237294186',
    projectId: 'customerdatarecord-9ef81',
    storageBucket: 'customerdatarecord-9ef81.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCRvYOfzhqbmYG4SsqNx3hI4QgrEREHTgo',
    appId: '1:927237294186:ios:79383c48bb2a6669022213',
    messagingSenderId: '927237294186',
    projectId: 'customerdatarecord-9ef81',
    storageBucket: 'customerdatarecord-9ef81.appspot.com',
    iosBundleId: 'com.example.customerDataRecording',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCRvYOfzhqbmYG4SsqNx3hI4QgrEREHTgo',
    appId: '1:927237294186:ios:ae86d20a851d9785022213',
    messagingSenderId: '927237294186',
    projectId: 'customerdatarecord-9ef81',
    storageBucket: 'customerdatarecord-9ef81.appspot.com',
    iosBundleId: 'com.example.customerDataRecording.RunnerTests',
  );
}
