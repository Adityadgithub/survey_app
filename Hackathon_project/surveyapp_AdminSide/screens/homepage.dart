import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orangeAccent,
        onPressed: () {
          Navigator.pushNamed(context, "FormTemplate");
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      endDrawer: Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text("Your Surveys"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Nothing to see here."),
          Text("Click on + button to publish a post!")
        ],
      )),
    );
  }
}
