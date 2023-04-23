import 'package:flutter/material.dart';
import 'package:surveyapp/screens/Template.dart';

class FormTemplate extends StatelessWidget {
  const FormTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.orangeAccent,
            title: Text("Select your Template")),
        body: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 25,
          childAspectRatio: 2.4/3,
          padding: EdgeInsets.all(15),
          children: [
            Template(title: "Blank", imageUrl: "images/blank.png"),
            Template(
                title: "Contact Information",
                imageUrl: "images/contactform.png"),
            Template(title: "Party Invite", imageUrl: "images/partyform.png"),
            Template(title: "Event", imageUrl: "images/eventform.png")
          ],
        ));
  }
}
