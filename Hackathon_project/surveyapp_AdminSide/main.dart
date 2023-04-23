import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:surveyapp/screens/dashboard.dart';
import 'package:surveyapp/screens/formtemplate.dart';
import 'package:surveyapp/screens/homepage.dart';
import 'package:surveyapp/screens/posted.dart';
import 'package:surveyapp/screens/signup.dart';
import 'package:surveyapp/screens/surveys/newsurvey.dart';

import 'screens/loginpage.dart';

void main() async {
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
      
      routes: {
        "SignUpPage": (context) => SignUpPage(),
        "LoginPage": (context) => LoginPage(),
        "Homepage": (context) => Homepage(),
        "DashboardScreen": (context) => DashboardScreen(),
        "newsurvey": (context) => newsurvey(),
        "FormTemplate": (context) => FormTemplate(),
        "PostDone": (context) => PostDone(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}
