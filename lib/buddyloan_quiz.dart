import 'package:flutter/material.dart';





class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int currentQuestionIndex = 0;
  int score = 0;
  int totalQuestions = 0;
  int currentQuestionNumber = 1;

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

  @override
  void initState() {
    super.initState();
    totalQuestions = questions.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Buddy Loan"),
        backgroundColor: Colors.blueGrey[300],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Question Number
            Text(
              'Question $currentQuestionNumber/$totalQuestions',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            // Question and Options Card
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Question
                  Container(
                    height: 170,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Center(
                        child: Text(
                          questions[currentQuestionIndex].question,
                          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  // Options
                  Column(
                    children: List.generate(
                      questions[currentQuestionIndex].options.length,
                          (index) {
                        return buildOptionCard(
                          questions[currentQuestionIndex].options[index],
                          isSelected: questions[currentQuestionIndex].selectedOption == questions[currentQuestionIndex].options[index],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildOptionCard(String option, {bool isSelected = false}) {
    return Padding(
      padding: const EdgeInsets.all(11.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: isSelected ? Colors.lightBlue[100] : Color(0xFFABD1C6),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: ListTile(
          leading: questions[currentQuestionIndex].selectedOption == option
              ? Icon(Icons.check_circle, color: Colors.green)
              : Icon(Icons.radio_button_unchecked, color: Colors.grey),
          title: Text(
            option,
            style: TextStyle(
              color: questions[currentQuestionIndex].selectedOption == option
                  ? Colors.white
                  : Colors.black,
            ),
          ),
          onTap: () {
            setState(() {
              questions[currentQuestionIndex].selectedOption = option;
              moveToNextQuestion();
            });
          },
        ),
      ),
    );
  }

  void moveToNextQuestion() {
    if (currentQuestionIndex < totalQuestions - 1) {
      setState(() {
        currentQuestionIndex++;
        currentQuestionNumber++;
      });
    } else {
      showResult();
    }
  }

  void showResult() {
    int correctAnswers = 0;
    for (int i = 0; i < totalQuestions; i++) {
      if (questions[i].selectedOption == questions[i].correctAnswer) {
        correctAnswers++;
      }
    }
    score = (correctAnswers / totalQuestions * 100).round();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Quiz Result"),
          content: Column(
            children: [
              Text("Your Score: $score%"),
              SizedBox(height: 16.0),
              Text(
                "Congratulations!",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }
}

class Question {
  String question;
  List<String> options;
  String correctAnswer;
  String? selectedOption;

  Question({
    required this.question,
    required this.options,
    required this.correctAnswer,
  });
}