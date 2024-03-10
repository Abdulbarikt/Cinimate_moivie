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
    apiKey: 'AIzaSyCyCelD7fHR15jVhOEzVpDmDSGweBQ6h_0',
    appId: '1:388004258516:web:77309fa40d9d2065285141',
    messagingSenderId: '388004258516',
    projectId: 'movieapp-d59ad',
    authDomain: 'movieapp-d59ad.firebaseapp.com',
    storageBucket: 'movieapp-d59ad.appspot.com',
    measurementId: 'G-LVP0R253DS',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDyusglWUfoXlwtkH965WVuFma1uu20LUA',
    appId: '1:388004258516:android:d40a7675a035ba43285141',
    messagingSenderId: '388004258516',
    projectId: 'movieapp-d59ad',
    storageBucket: 'movieapp-d59ad.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAb_Q9h5aZEXL8uPT2l21YWLaXcXOIJ5e8',
    appId: '1:388004258516:ios:f8e7e78eda2951c9285141',
    messagingSenderId: '388004258516',
    projectId: 'movieapp-d59ad',
    storageBucket: 'movieapp-d59ad.appspot.com',
    iosBundleId: 'com.example.movieApi',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAb_Q9h5aZEXL8uPT2l21YWLaXcXOIJ5e8',
    appId: '1:388004258516:ios:2377ff8d0ea424f5285141',
    messagingSenderId: '388004258516',
    projectId: 'movieapp-d59ad',
    storageBucket: 'movieapp-d59ad.appspot.com',
    iosBundleId: 'com.example.movieApi.RunnerTests',
  );
}
