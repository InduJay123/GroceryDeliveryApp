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
    apiKey: 'AIzaSyA7sYTTMHGI5s2vJz7pIQ6Nz1Ee0oqNkbw',
    appId: '1:792978585042:web:091911f3af17b6d40d440b',
    messagingSenderId: '792978585042',
    projectId: 'newnewapp-87dbb',
    authDomain: 'newnewapp-87dbb.firebaseapp.com',
    storageBucket: 'newnewapp-87dbb.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCrEXfkVIEtUY1djcYtcbuTpSjXXyC3SDc',
    appId: '1:792978585042:android:901313313c6268650d440b',
    messagingSenderId: '792978585042',
    projectId: 'newnewapp-87dbb',
    storageBucket: 'newnewapp-87dbb.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB3O8O07-ynMa_x3Igp0tJSdtdiPSpTpS4',
    appId: '1:792978585042:ios:b11b85d8477780b30d440b',
    messagingSenderId: '792978585042',
    projectId: 'newnewapp-87dbb',
    storageBucket: 'newnewapp-87dbb.firebasestorage.app',
    iosBundleId: 'com.example.foodDeliveryApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB3O8O07-ynMa_x3Igp0tJSdtdiPSpTpS4',
    appId: '1:792978585042:ios:b11b85d8477780b30d440b',
    messagingSenderId: '792978585042',
    projectId: 'newnewapp-87dbb',
    storageBucket: 'newnewapp-87dbb.firebasestorage.app',
    iosBundleId: 'com.example.foodDeliveryApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyA7sYTTMHGI5s2vJz7pIQ6Nz1Ee0oqNkbw',
    appId: '1:792978585042:web:3e6f19f556adc6930d440b',
    messagingSenderId: '792978585042',
    projectId: 'newnewapp-87dbb',
    authDomain: 'newnewapp-87dbb.firebaseapp.com',
    storageBucket: 'newnewapp-87dbb.firebasestorage.app',
  );
}
