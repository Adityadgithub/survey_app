import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Screens/Homepage.dart';
import 'Screens/splashscreen.dart';
import 'Screens/survye.dart';
import 'justtemp.dart';

Future<void> main() async {
     WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: SplashScreen(),
      routes: {
        "Homepage": (context) => Homepage(),
        "justtemp": (context) => justtemp(),
      },
    );
  }
}
