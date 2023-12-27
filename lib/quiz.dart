import 'package:flutter/material.dart';
import 'quizmodal.dart';


class QuizPage extends StatefulWidget {

  final Quiz quiz;

  QuizPage({required this.quiz});
  @override
  _QuizPageState createState() => _QuizPageState();
}
class _QuizPageState extends State<QuizPage> {
  int? _selectedOption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
          automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(16.0),
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue, width: 2.0),
              borderRadius: BorderRadius.circular(12.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Image.network(
             widget.quiz.currentQuestion.url,
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.quiz.currentQuestion.question,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),

          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: widget.quiz.currentQuestion.options.length,
              itemBuilder: (context, index) {
                return RadioListTile<int>(
                  title: Text(widget.quiz.currentQuestion.options[index].option),
                  value: index,
                  groupValue: _selectedOption,
                  onChanged: (value) {
                    setState(() {
                      _selectedOption = value;
                    });
                  },
                  activeColor: Colors.blue,
                );
              },
            ),
          ),

          ElevatedButton(
            child: Text('Next', style: TextStyle(color: Colors.white)),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            ),
            onPressed: _selectedOption == null
                ? null
                : () {
              widget.quiz.answer(widget.quiz.currentQuestion.options[_selectedOption!].isCorrect);
              if (widget.quiz.isFinished()) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(scores: widget.quiz.score, wrong: widget.quiz.wrong, total: widget.quiz.total, questions: widget.quiz.questions),
                  ),
                );
              } else {
                setState(() {
                  _selectedOption = null;
                });
              }
            },
          ),
        ],
      ),
    );
  }

}


class ResultPage extends StatelessWidget {
  final int scores;
  final int wrong;
  final int total;
  final List<Question> questions;

  ResultPage({required this.scores, required this.wrong, required this.total, required this.questions});

  Quiz _generateNewQuiz() {
    return Quiz(questions: questions);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your Quiz Result',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            SizedBox(height: 20.0),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildResultCard('Total Score', scores, Colors.green),
                _buildResultCard('Wrong Answers', wrong, Colors.red),
                _buildResultCard('Total Questions', total, Colors.blue),
              ],
            ),

            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Reset the quiz by navigating to a new QuizPage
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => QuizPage(quiz: _generateNewQuiz())
                    )
                );
              },
              child: Text('Reset Quiz'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResultCard(String label, int value, Color color) {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(7.0),
          child: Column(
            children: [
              Text(
                label,
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: color),
              ),
              SizedBox(height: 10.0),
              Text(
                '$value',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
