import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:surveyuserapp/model/Survey.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text(
          'Surveys',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Column(children: [
        // Container(width: MediaQuery.of(context).size.width,
        //   decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(10), color: Colors.white),
        //   child: Row(
        //     children: [
        //       Text("Sample Survey"),
        //       Icon(Icons.arrow_forward_ios_outlined)
        //     ],
        //   ),
        // )
        ListModel()
      ]),
    );
  }
}
