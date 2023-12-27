



class Question {
  final String question;
  final List<Option> options;
  final String url;

  Question({required this.question, required this.options, required this.url});
}

class Option {
  final String option;
  final bool isCorrect;

  Option({required this.option, required this.isCorrect});
}

class Quiz {
  List<Question> questions;
  int currentQuestionIndex;
  int score;
  int wrong;
  int total;

  Quiz({required this.questions})
      : currentQuestionIndex = 0,
        score = 0,
        wrong = 0,
        total = questions.length;


  Question get currentQuestion => questions[currentQuestionIndex];

  void answer(bool isCorrect) {
    if (isCorrect) {
      score++;
    }
    else {
      wrong++;
    }
    currentQuestionIndex++;
  }

  bool isFinished() {
    return currentQuestionIndex >= questions.length;
  }
}