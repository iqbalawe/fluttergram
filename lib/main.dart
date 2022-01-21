import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/register_screen.dart';

import 'responsive/responsive.dart';
import 'utils/utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyAgDj9Y4irQr8JEdSIjUhy3JW-hUEo39sM",
        appId: "1:785428171837:web:0133feb81c92384a4eae54",
        messagingSenderId: "785428171837",
        projectId: "fluttergram-5069b",
        storageBucket: "fluttergram-5069b.appspot.com",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),
      // home: const ResponsiveScreen(
      //   webScrenLayout: WebScreenLayout(),
      //   mobileScrenLayout: MobileScreenLayout(),
      // ),
      home: const RegisterScreen(),
    );
  }
}
