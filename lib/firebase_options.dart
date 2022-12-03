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
    apiKey: 'AIzaSyAQn7UJLJC-rw2Ao6SJ2ZwVo6-3gVSnmjw',
    appId: '1:952973566078:web:0a66fe89e0e59157b0782f',
    messagingSenderId: '952973566078',
    projectId: 'nesscale-assignment',
    authDomain: 'nesscale-assignment.firebaseapp.com',
    storageBucket: 'nesscale-assignment.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAGLxXBC9V-stzMe6HZY7BcoN7PHBVDmOk',
    appId: '1:952973566078:android:b37d5f1396b10848b0782f',
    messagingSenderId: '952973566078',
    projectId: 'nesscale-assignment',
    storageBucket: 'nesscale-assignment.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBBu7QmNZ1YtweKFj_bcxAzPDZFzz6u6QA',
    appId: '1:952973566078:ios:dbc24010bdde660bb0782f',
    messagingSenderId: '952973566078',
    projectId: 'nesscale-assignment',
    storageBucket: 'nesscale-assignment.appspot.com',
    iosClientId: '952973566078-v5qgu5lbp1i5suo1tf6p579u6lua34i1.apps.googleusercontent.com',
    iosBundleId: 'com.example.alvishNesscaleAssignment',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBBu7QmNZ1YtweKFj_bcxAzPDZFzz6u6QA',
    appId: '1:952973566078:ios:dbc24010bdde660bb0782f',
    messagingSenderId: '952973566078',
    projectId: 'nesscale-assignment',
    storageBucket: 'nesscale-assignment.appspot.com',
    iosClientId: '952973566078-v5qgu5lbp1i5suo1tf6p579u6lua34i1.apps.googleusercontent.com',
    iosBundleId: 'com.example.alvishNesscaleAssignment',
  );
}