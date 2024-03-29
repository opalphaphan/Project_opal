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
    apiKey: 'AIzaSyBfWR7X1FkaIv0kfWwapd5RapizoLaABok',
    appId: '1:894328550971:web:0e0ead8d1fe68c45610e1e',
    messagingSenderId: '894328550971',
    projectId: 'fir-demo-f965f',
    authDomain: 'fir-demo-f965f.firebaseapp.com',
    storageBucket: 'fir-demo-f965f.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBtVNdpby4YIiv4qam2VLZ5Z3rdgkrfzkE',
    appId: '1:894328550971:android:6df77c6b542d55af610e1e',
    messagingSenderId: '894328550971',
    projectId: 'fir-demo-f965f',
    storageBucket: 'fir-demo-f965f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA4ERDW_kK6KRBIyKnn9PBq6df4Bet1syM',
    appId: '1:894328550971:ios:3a1ec75e7fa1ba46610e1e',
    messagingSenderId: '894328550971',
    projectId: 'fir-demo-f965f',
    storageBucket: 'fir-demo-f965f.appspot.com',
    iosBundleId: 'com.example.project',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA4ERDW_kK6KRBIyKnn9PBq6df4Bet1syM',
    appId: '1:894328550971:ios:9d579b7eb6e7137d610e1e',
    messagingSenderId: '894328550971',
    projectId: 'fir-demo-f965f',
    storageBucket: 'fir-demo-f965f.appspot.com',
    iosBundleId: 'com.example.project.RunnerTests',
  );
}
