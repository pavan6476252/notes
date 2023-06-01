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
    apiKey: 'AIzaSyAONF7CImUW87X-WGmm9GM6YWeABNxxze0',
    appId: '1:2673532249:web:b05eb738d3490e5b99c048',
    messagingSenderId: '2673532249',
    projectId: 'notes-6b4d5',
    authDomain: 'notes-6b4d5.firebaseapp.com',
    storageBucket: 'notes-6b4d5.appspot.com',
    measurementId: 'G-ERJN0M1DVN',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBZh4vP2B7bk-s_D44PiSH4tWE31fMUXl0',
    appId: '1:2673532249:android:801ca2d28a2bf59299c048',
    messagingSenderId: '2673532249',
    projectId: 'notes-6b4d5',
    storageBucket: 'notes-6b4d5.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBWeHrQu67NBWZA_oVZtLYoZX0fSYW_Smk',
    appId: '1:2673532249:ios:f0f4085b50b7256399c048',
    messagingSenderId: '2673532249',
    projectId: 'notes-6b4d5',
    storageBucket: 'notes-6b4d5.appspot.com',
    iosBundleId: 'com.meesalapavankumar.notes',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBWeHrQu67NBWZA_oVZtLYoZX0fSYW_Smk',
    appId: '1:2673532249:ios:615277647e1e10f899c048',
    messagingSenderId: '2673532249',
    projectId: 'notes-6b4d5',
    storageBucket: 'notes-6b4d5.appspot.com',
    iosBundleId: 'com.meesalapavankumar.notes.RunnerTests',
  );
}
