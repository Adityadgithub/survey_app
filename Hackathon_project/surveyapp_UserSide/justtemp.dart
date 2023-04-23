import 'package:flutter/material.dart';

// import 'package:flutter/material.dart';

class justtemp extends StatefulWidget {
  const justtemp({Key? key}) : super(key: key);

  @override
  State<justtemp> createState() => _justtempState();
}

class _justtempState extends State<justtemp> {
  // Define a list of questions and their corresponding answers
  final List<Question> questions = [
    Question(
      'What is your favorite color?',
      ['Red', 'Green', 'Blue', 'Yellow'],
    ),
    Question(
      'What is your favorite animal?',
      ['Dog', 'Cat', 'Bird', 'Fish'],
    ),
  ];

  // Define a variable to keep track of the selected answer for each question
  final Map<int, int> selectedAnswers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Survey Page"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.navigate_next_rounded))
        ],
      ),
      body: ListView.builder(
        itemCount: questions.length,
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    questions[index].questionText,
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                ...List<Widget>.generate(
                  questions[index].answerOptions.length,
                  (i) => RadioListTile<int>(
                    title: Text(questions[index].answerOptions[i]),
                    value: i,
                    groupValue: selectedAnswers[index],
                    onChanged: (int? value) {
                      setState(() {
                        selectedAnswers[index] = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// Define a model for a question
class Question {
  final String questionText;
  final List<String> answerOptions;

  Question(this.questionText, this.answerOptions);
}