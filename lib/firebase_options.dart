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
    apiKey: 'AIzaSyBPKIkt7dHnUQpBOEjdDeCx9XCU4TmnFvM',
    appId: '1:538636107041:web:9c80f43c32a0fe31a5d260',
    messagingSenderId: '538636107041',
    projectId: 'courseflutter-4cc52',
    authDomain: 'courseflutter-4cc52.firebaseapp.com',
    storageBucket: 'courseflutter-4cc52.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAVons-lslumzOKVSvbqxdeqiz4UXtNv0s',
    appId: '1:538636107041:android:da6f766909b29375a5d260',
    messagingSenderId: '538636107041',
    projectId: 'courseflutter-4cc52',
    storageBucket: 'courseflutter-4cc52.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAMcUNl_whi81pa45OpiSqj4bOchdOpau8',
    appId: '1:538636107041:ios:a9744b6f2a6b95cea5d260',
    messagingSenderId: '538636107041',
    projectId: 'courseflutter-4cc52',
    storageBucket: 'courseflutter-4cc52.appspot.com',
    iosBundleId: 'com.example.ropulvaTaskAppAssesment',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAMcUNl_whi81pa45OpiSqj4bOchdOpau8',
    appId: '1:538636107041:ios:a9744b6f2a6b95cea5d260',
    messagingSenderId: '538636107041',
    projectId: 'courseflutter-4cc52',
    storageBucket: 'courseflutter-4cc52.appspot.com',
    iosBundleId: 'com.example.ropulvaTaskAppAssesment',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBPKIkt7dHnUQpBOEjdDeCx9XCU4TmnFvM',
    appId: '1:538636107041:web:9ad58087f0f5eb6ea5d260',
    messagingSenderId: '538636107041',
    projectId: 'courseflutter-4cc52',
    authDomain: 'courseflutter-4cc52.firebaseapp.com',
    storageBucket: 'courseflutter-4cc52.appspot.com',
  );
}