// Following is the code for Splash Screen that will
// display for 2000 milli second while starting the application.

import 'package:flutter/material.dart';
import 'homepage.dart';

class PostDone extends StatefulWidget {
  const PostDone({Key? key}) : super(key: key);

  @override
  _PostDoneState createState() => _PostDoneState();
}

var globalusertoken;

class _PostDoneState extends State<PostDone> {



  //with a delay of 2000 millisec, the title and logo will appear on the screen.
  _navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 2000), () {});
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>  Homepage(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Text('')),
    );
  }
}
