import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyB-ws1nPfcV1pQfibi5_m7BvAYFrRDyipM",
            authDomain: "absentapp-623bd.firebaseapp.com",
            projectId: "absentapp-623bd",
            storageBucket: "absentapp-623bd.appspot.com",
            messagingSenderId: "248562905566",
            appId: "1:248562905566:web:1dbd882cef4b0a114cad4f",
            measurementId: "G-XM4NC02CL3"));
  } else {
    await Firebase.initializeApp();
  }
}
