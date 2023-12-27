import 'dart:async';
import 'package:flutter/material.dart';



class Question {
  final String question;
  final List<String> options;
  final String correctAnswer;

  Question({required this.question, required this.options, required this.correctAnswer});
}



class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int currentQuestionIndex = 0;

  List<Question> questions = [
    Question(
      question: 'What is the capital of France?',
      options: ['A. London', 'B. Paris', 'C. Berlin', 'D. Madrid'],
      correctAnswer: 'B. Paris',
    ),
    Question(
      question: 'Which planet is known as the Red Planet?',
      options: ['A. Earth', 'B. Mars', 'C. Venus', 'D. Jupiter'],
      correctAnswer: 'B. Mars',
    ),
    // Add more questions here
  ];

   late int totalQuestions;
  int secondsRemaining = 30;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    totalQuestions = questions.length;
    startTimer();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        if (secondsRemaining > 0) {
          secondsRemaining--;
        } else {
          // TODO: Handle timer expiration, e.g., move to the next question
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Circular Progress Bar with Seconds Text
            Container(
              width: 100,
              height: 100,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircularProgressIndicator(
                    value: secondsRemaining / 30,
                    valueColor: AlwaysStoppedAnimation<Color>(
                        Color.lerp(Colors.red, Colors.green, secondsRemaining / 30) ?? Colors.green                    ),
                    strokeWidth: 10,
                  ),
                  Text(
                    '$secondsRemaining',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),

            // Timer
            SizedBox(height: 20),

            // Question Container
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                'Question ${currentQuestionIndex + 1}: ${questions[currentQuestionIndex].question}',
                style: TextStyle(fontSize: 20),
              ),
            ),

            // Options Containers
            SizedBox(height: 20),
            Column(
              children: [
                buildOption(1, questions[currentQuestionIndex].options[0]),
                buildOption(2, questions[currentQuestionIndex].options[1]),
                buildOption(3, questions[currentQuestionIndex].options[2]),
                buildOption(4, questions[currentQuestionIndex].options[3]),
              ],
            ),

            // Next Button
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO: Handle next button click
                setState(() {
                  // Reset timer for the next question
                  secondsRemaining = 30;

                  // Move to the next question
                  if (currentQuestionIndex < totalQuestions - 1) {
                    currentQuestionIndex++;
                  } else {
                    // TODO: Handle quiz completion
                  }
                });
              },
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildOption(int optionNumber, String optionText) {
    // TODO: Implement option widgets with radio buttons
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Radio(
            value: optionNumber,
            groupValue: null, // TODO: Provide the selected value
            onChanged: (value) {
              // TODO: Handle radio button selection
            },
          ),
          SizedBox(width: 10),
          Text(optionText),
        ],
      ),
    );
  }
}
