import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDvFP95YFKy_WGwgSIyfifQ53yRFJFLUDU",
            authDomain: "a-smart-products.firebaseapp.com",
            projectId: "a-smart-products",
            storageBucket: "a-smart-products.appspot.com",
            messagingSenderId: "629290102552",
            appId: "1:629290102552:web:cb08a5481b07eba049386d",
            measurementId: "G-LNZJQMH1BS"));
  } else {
    await Firebase.initializeApp();
  }
}
