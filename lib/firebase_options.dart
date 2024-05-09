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
    apiKey: 'AIzaSyAwWtBs93i8-sqz9ZB4rozW3CCdnSywZsk',
    appId: '1:997316388875:web:1b4501f8358402a7917f0e',
    messagingSenderId: '997316388875',
    projectId: 'medheal-f1d46',
    authDomain: 'medheal-f1d46.firebaseapp.com',
    storageBucket: 'medheal-f1d46.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBG7pkVTj1NVtVEEjcEQoSemw4QOfZpriE',
    appId: '1:997316388875:android:9ca30e21686c93f1917f0e',
    messagingSenderId: '997316388875',
    projectId: 'medheal-f1d46',
    storageBucket: 'medheal-f1d46.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA5XV0vcd7tc9Q-p5b4bJtCVZjLMCoLbTw',
    appId: '1:997316388875:ios:89fdaac6bcbf5180917f0e',
    messagingSenderId: '997316388875',
    projectId: 'medheal-f1d46',
    storageBucket: 'medheal-f1d46.appspot.com',
    iosClientId: '997316388875-sst6gibiocp99doa41nga4m9jhuee4gp.apps.googleusercontent.com',
    iosBundleId: 'com.example.medheal',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA5XV0vcd7tc9Q-p5b4bJtCVZjLMCoLbTw',
    appId: '1:997316388875:ios:f0f3c11c6457eeb6917f0e',
    messagingSenderId: '997316388875',
    projectId: 'medheal-f1d46',
    storageBucket: 'medheal-f1d46.appspot.com',
    iosClientId: '997316388875-2e9loo7vito1i03ac8962888itjuin97.apps.googleusercontent.com',
    iosBundleId: 'com.example.medheal.RunnerTests',
  );
}
