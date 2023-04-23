import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class newsurvey extends StatefulWidget {
  @override
  _newsurveyState createState() => _newsurveyState();
}

class _newsurveyState extends State<newsurvey> {
  final _formKey = GlobalKey<FormState>();
  final List<Question> _questions = [];
  int surveyindex = 0;


  bool showtype = false;

  void _addQuestion() {
    setState(() {
    surveyindex += 1;
      _questions.add(Question(surveyindex: surveyindex));
    });
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text(
          'Survey Form',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Questions',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                _questions.isNotEmpty
                    ? Column(
                        children: _questions.map((question) {
                          return question.build();
                        }).toList(),
                      )
                    : SizedBox(),
                SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    _addQuestion();
                  },
                  child: Text(
                    'Add Question',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orangeAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 16),
                  ),
                ),
                SizedBox(height: 32),
                if (_questions.isNotEmpty)
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Submit the form
                        for (Question question in _questions) {
                          print(question.question);
                          print(question.answer1);
                          print(question.answer2);
                          print(question.answer3);
                          print(question.answer4);
                          print('');
                        }
                        Navigator.pushNamed(context,"PostDone");
                      }
                    },
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orangeAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Question {
  String? question;
  String? answer1;
  String? answer2;
  String? answer3;
  String? answer4;
  var surveyindex;
  Question({this.surveyindex});
  Widget build() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Question ${surveyindex}',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Question',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your question';
            }
            return null;
          },
          onChanged: (value) async {
            question = value;
            final surveyDoc = FirebaseFirestore.instance
    .collection('Survey1')
    .doc('$surveyindex');

final surveyDocSnapshot = await surveyDoc.get();
if (surveyDocSnapshot.exists) {
  await surveyDoc.update({'question': question.toString()});
} else {
  await surveyDoc.set({'question': question.toString()});
}
          },
        
          
        ),
        SizedBox(height: 16),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Answer Option 1',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter answer option 1';
            }
            return null;
          },
          onChanged: (value) async {
            answer1 = value;
               
            final surveyDoc = FirebaseFirestore.instance
    .collection('Survey1')
    .doc('$surveyindex');

final surveyDocSnapshot = await surveyDoc.get();
if (surveyDocSnapshot.exists) {
  await surveyDoc.update({'answer1': answer1.toString()});
} else {
  await surveyDoc.set({'answer1': answer1.toString()});
}
         
          },
        ),
        SizedBox(height: 8),
        TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            hintText: 'Answer option 2',
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter answer option 2';
            }
            return null;
          },
          onChanged: (value) async {
            answer2 = value;
           final surveyDoc = FirebaseFirestore.instance
    .collection('Survey1')
    .doc('$surveyindex');

final surveyDocSnapshot = await surveyDoc.get();
if (surveyDocSnapshot.exists) {
  await surveyDoc.update({'answer2': answer2.toString()});
} else {
  await surveyDoc.set({'answer2': answer2.toString()});
}
          },
        ),
        SizedBox(height: 8),
        TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            hintText: 'Answer option 3',
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter answer option 3';
            }
            return null;
          },
          onChanged: (value) async {
            answer3 = value;
               final surveyDoc = FirebaseFirestore.instance
    .collection('Survey1')
    .doc('$surveyindex');

final surveyDocSnapshot = await surveyDoc.get();
if (surveyDocSnapshot.exists) {
  await surveyDoc.update({'answer3': answer3.toString()});
} else {
  await surveyDoc.set({'answer3': answer3.toString()});
}
          },
        ),
        SizedBox(height: 8),
        TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            hintText: 'Answer option 4',
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter answer option 4';
            }
            return null;
          },
          onChanged: (value) async {
            answer4 = value;
                    final surveyDoc = FirebaseFirestore.instance
    .collection('Survey1')
    .doc('$surveyindex');

final surveyDocSnapshot = await surveyDoc.get();
if (surveyDocSnapshot.exists) {
  await surveyDoc.update({'answer4': answer4.toString()});
} else {
  await surveyDoc.set({'answer4': answer4.toString()});
}
          },
        ),
        SizedBox(height: 16),
      ],
    );
  }
}
