import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAjRx-sXgDC46a2aG31jcExyghLFCiJc7g",
            authDomain: "smarts-products.firebaseapp.com",
            projectId: "smarts-products",
            storageBucket: "smarts-products.appspot.com",
            messagingSenderId: "720882714928",
            appId: "1:720882714928:web:91701964db92dfb60060f5",
            measurementId: "G-DJBQH2RMM5"));
  } else {
    await Firebase.initializeApp();
  }
}
