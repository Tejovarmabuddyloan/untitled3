import 'package:flutter/material.dart';

class Question {
  String question;
  List<String> options;
  String correctAnswer;

  Question({ required this.question,  required this.options,  required this.correctAnswer});
}

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<Question> _questions = [];
  int _currentQuestionIndex = 0;
  Map<int, String> _userAnswers = {};

  @override
  void initState() {
    super.initState();
    _loadQuiz();
  }

  void _loadQuiz() {
    // Define your quiz data here with 15 questions
    List<Map<String, dynamic>> jsonData = [
      {
        "question": "What is the capital of France?",
        "options": ["Berlin", "Madrid", "Paris", "Rome",],
        "correctAnswer": "Paris",
      },
      {
        "question": "Which planet is known as the Red Planet?",
        "options": ["Mars", "Venus", "Jupiter", "Saturn"],
        "correctAnswer": "Mars",
      },
      {
        "question": "What is the largest mammal in the world?",
        "options": ["Elephant", "Blue Whale", "Giraffe", "Hippopotamus"],
        "correctAnswer": "Blue Whale",
      },
      {
        "question": "Which country is known as the Land of the Rising Sun?",
        "options": ["China", "South Korea", "Japan", "Vietnam"],
        "correctAnswer": "Japan",
      },
      {
        "question": "In which year did World War II end?",
        "options": ["1943", "1945", "1947", "1950"],
        "correctAnswer": "1945",
      },
      {
        "question": "Who wrote 'Romeo and Juliet'?",
        "options": ["William Shakespeare", "Jane Austen", "Charles Dickens", "Mark Twain"],
        "correctAnswer": "William Shakespeare",
      },
      {
        "question": "Which element has the chemical symbol 'O'?",
        "options": ["Oxygen", "Gold", "Silver", "Copper"],
        "correctAnswer": "Oxygen",
      },
      {
        "question": "What is the largest ocean on Earth?",
        "options": ["Atlantic Ocean", "Indian Ocean", "Southern Ocean", "Pacific Ocean"],
        "correctAnswer": "Pacific Ocean",
      },
      {
        "question": "Who painted the Mona Lisa?",
        "options": ["Vincent van Gogh", "Leonardo da Vinci", "Pablo Picasso", "Claude Monet"],
        "correctAnswer": "Leonardo da Vinci",
      },
      {
        "question": "Which planet is known as the 'Red Planet'?",
        "options": ["Mars", "Venus", "Jupiter", "Saturn"],
        "correctAnswer": "Mars",
      },
      {
        "question": "What is the currency of Japan?",
        "options": ["Yuan", "Won", "Yen", "Ringgit"],
        "correctAnswer": "Yen",
      },
      {
        "question": "Who developed the theory of relativity?",
        "options": ["Isaac Newton", "Albert Einstein", "Galileo Galilei", "Stephen Hawking"],
        "correctAnswer": "Albert Einstein",
      },
      {
        "question": "Which gas makes up the majority of Earth's atmosphere?",
        "options": ["Oxygen", "Nitrogen", "Carbon Dioxide", "Argon"],
        "correctAnswer": "Nitrogen",
      },
      {
        "question": "What is the largest desert in the world?",
        "options": ["Gobi Desert", "Sahara Desert", "Arabian Desert", "Antarctica"],
        "correctAnswer": "Antarctica",
      },
      {
        "question": "Who wrote '1984'?",
        "options": ["George Orwell", "Aldous Huxley", "Ray Bradbury", "F. Scott Fitzgerald"],
        "correctAnswer": "George Orwell",
      },
    ];

    _questions = jsonData.map((item) => Question(
      question: item['question'],
      options: List<String>.from(item['options']),
      correctAnswer: item['correctAnswer'],
    )).toList();
  }

  Widget _buildOptions() {
    if (_currentQuestionIndex < 0 || _currentQuestionIndex >= _questions.length) {
      return Text('Invalid question index');
    }

    return Column(
      children: _questions[_currentQuestionIndex].options
          .map(
            (option) => ListTile(
          title: Text(
            option,
            style: TextStyle(
              color: _userAnswers[_currentQuestionIndex] == option
                  ? Colors.blue
                  : Colors.black,
            ),
          ),
          trailing: _userAnswers[_currentQuestionIndex] == option
              ? Icon(Icons.check_circle, color: Colors.green)
              : Icon(Icons.radio_button_unchecked, color: Colors.black),
          onTap: () {
            setState(() {
              _userAnswers[_currentQuestionIndex] = option;
              _moveToNextQuestion();
            });
          },
        ),
      )
          .toList(),
    );
  }

  void _moveToNextQuestion() {
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        if (_currentQuestionIndex < _questions.length - 1) {
          _currentQuestionIndex++;
        } else {
          // Quiz is finished, navigate to the result page
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResultScreen(_calculateScore(), _questions.length),
            ),
          );
        }
      });
    });
  }

  void _moveToPreviousQuestion() {
    setState(() {
      if (_currentQuestionIndex > 0) {
        _currentQuestionIndex--;
      }
    });
  }

  int _calculateScore() {
    int score = 0;
    for (int i = 0; i < _questions.length; i++) {
      if (_userAnswers.containsKey(i) && _userAnswers[i] == _questions[i].correctAnswer) {
        score++;
      }
    }
    return score;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        title: Text('Quiz',textAlign: TextAlign.center,),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20,),

            Container(
              width: MediaQuery.of(context).size.width, // Set the width to the screen width
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.circular(15.0), // Set the border radius you want
              // ),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(11.0), // Adjust the radius as needed
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      '${_currentQuestionIndex + 1}. ${_questions[_currentQuestionIndex].question}',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [

                    _buildOptions(),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(right: 20,left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Question ${_currentQuestionIndex + 1} of ${_questions.length}',
                    style: TextStyle(fontSize: 16),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade200,
                      elevation: 5, // Elevation to give the button a raised effect
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: _moveToPreviousQuestion,
                    child: Text('Previous',style: TextStyle(color: Colors.black,fontFamily: 'Inter',fontWeight:FontWeight.bold,fontSize: 16 ),),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ResultScreen extends StatelessWidget {
  final int score;
  final int totalQuestions;

  ResultScreen(this.score, this.totalQuestions);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
        centerTitle: true,

      ),

      body: Container(
        color: Colors.blue.shade100,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,// Set the width to the screen width
       




        child: Card(




          elevation: 5,
          margin: EdgeInsets.only(top: 20, bottom: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Add this
            crossAxisAlignment: CrossAxisAlignment.center, // Add this

            children: [
              Text(
                'Thanks for participating in the quiz!',
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Image.network(
                'https://www.buddyloan.com/assets/image/loan-types/Personal-Loan.gif',
                width: 250,
                height: 250,

              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Handle the selfie button press
                },
                child: Text('Click Selfie'),
                style: ElevatedButton.styleFrom(
                   backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                ),
              ),
              SizedBox(height: 40),
              Text(
                'Result will be announced on 1st January',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),


            ],
          ),
        ),
      ),
    );
  }
}

// import 'dart:convert';
// import 'dart:io';
//
// void storeSelectedOptions(Map<int, String> userAnswers) async {
//   String jsonString = jsonEncode(userAnswers);
//   final file = File('path_to_your_file.json');
//   await file.writeAsString(jsonString);
// }
// onTap: () {
// setState(() {
// _userAnswers[_currentQuestionIndex] = option;
// });
// storeSelectedOptions(_userAnswers);
// },