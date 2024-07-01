import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBjYqST5Qbt8KflqlEwEKNjzkjo1ytXIg0",
            authDomain: "park-check-1vbeik.firebaseapp.com",
            projectId: "park-check-1vbeik",
            storageBucket: "park-check-1vbeik.appspot.com",
            messagingSenderId: "58197813367",
            appId: "1:58197813367:web:c1a2bd46c4a9d620853e72"));
  } else {
    await Firebase.initializeApp();
  }
}
