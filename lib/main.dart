import 'package:flutter/material.dart';
import 'my_site.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyCXi0CdVoBAzEDLJxKsrQOcXpGpdpfmWnk",
          authDomain: "absolute-stay-55f8d.firebaseapp.com",
          projectId: "absolute-stay-55f8d",
          storageBucket: "absolute-stay-55f8d.appspot.com",
          messagingSenderId: "38920551381",
          appId: "1:38920551381:web:2e3b1b855c9b1bab4c5b5c",
          measurementId: "G-2MZZTWNVH9"
      ));
  runApp(const MySite());

}
