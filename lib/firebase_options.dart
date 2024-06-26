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
    apiKey: 'AIzaSyCb6759TVgAgLACtK0W62ECHCjrJVcUqss',
    appId: '1:821741951227:web:a5fbd0cf040a9babd6b85e',
    messagingSenderId: '821741951227',
    projectId: 'blackcofferproject-8c001',
    authDomain: 'blackcofferproject-8c001.firebaseapp.com',
    storageBucket: 'blackcofferproject-8c001.appspot.com',
    measurementId: 'G-JGTP1C6REM',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAN4158ALUBGjQvAAdb-s0NNymWhyFdDC8',
    appId: '1:821741951227:android:31c6ee8a64c2ddbdd6b85e',
    messagingSenderId: '821741951227',
    projectId: 'blackcofferproject-8c001',
    storageBucket: 'blackcofferproject-8c001.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB8XiTk2DxuWaLz_06CrTbkg7OuJDWcfjs',
    appId: '1:821741951227:ios:0eca197dacab9b6bd6b85e',
    messagingSenderId: '821741951227',
    projectId: 'blackcofferproject-8c001',
    storageBucket: 'blackcofferproject-8c001.appspot.com',
    iosBundleId: 'com.example.vmake',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB8XiTk2DxuWaLz_06CrTbkg7OuJDWcfjs',
    appId: '1:821741951227:ios:c29fbf012de6f0b3d6b85e',
    messagingSenderId: '821741951227',
    projectId: 'blackcofferproject-8c001',
    storageBucket: 'blackcofferproject-8c001.appspot.com',
    iosBundleId: 'com.example.vmake.RunnerTests',
  );
}
