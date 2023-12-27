// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class Question {
//   String question;
//   List<String> options;
//   String correctAnswer;
//
//   Question({ required this.question,  required this.options,  required this.correctAnswer});
// }
//
// class QuizScreen extends StatefulWidget {
//   @override
//   _QuizScreenState createState() => _QuizScreenState();
// }
//
// class _QuizScreenState extends State<QuizScreen> {
//   List<Question> _questions = [];
//   int _currentQuestionIndex = 0;
//   Map<int, String> _userAnswers = {};
//
//   @override
//   void initState() {
//     super.initState();
//     _loadQuiz();
//   }
//
//   void _loadQuiz() {
//     // Define your quiz data here with 15 questions
//     List<Map<String, dynamic>> jsonData = [
//       {
//         "question": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
//         "options": ["Berlin", "Madrid", "Paris", "Rome",],
//         "correctAnswer": "Paris",
//       },
//       {
//         "question": "Which planet is known as the Red Planet?",
//         "options": ["Mars", "Venus", "Jupiter", "Saturn"],
//         "correctAnswer": "Mars",
//       },
//       {
//         "question": "What is the largest mammal in the world?",
//         "options": ["Elephant", "Blue Whale", "Giraffe", "Hippopotamus"],
//         "correctAnswer": "Blue Whale",
//       },
//       {
//         "question": "Which country is known as the Land of the Rising Sun?",
//         "options": ["China", "South Korea", "Japan", "Vietnam"],
//         "correctAnswer": "Japan",
//       },
//       {
//         "question": "In which year did World War II end?",
//         "options": ["1943", "1945", "1947", "1950"],
//         "correctAnswer": "1945",
//       },
//       {
//         "question": "Who wrote 'Romeo and Juliet'?",
//         "options": ["William Shakespeare", "Jane Austen", "Charles Dickens", "Mark Twain"],
//         "correctAnswer": "William Shakespeare",
//       },
//       {
//         "question": "Which element has the chemical symbol 'O'?",
//         "options": ["Oxygen", "Gold", "Silver", "Copper"],
//         "correctAnswer": "Oxygen",
//       },
//       {
//         "question": "What is the largest ocean on Earth?",
//         "options": ["Atlantic Ocean", "Indian Ocean", "Southern Ocean", "Pacific Ocean"],
//         "correctAnswer": "Pacific Ocean",
//       },
//       {
//         "question": "Who painted the Mona Lisa?",
//         "options": ["Vincent van Gogh", "Leonardo da Vinci", "Pablo Picasso", "Claude Monet"],
//         "correctAnswer": "Leonardo da Vinci",
//       },
//       {
//         "question": "Which planet is known as the 'Red Planet'?",
//         "options": ["Mars", "Venus", "Jupiter", "Saturn"],
//         "correctAnswer": "Mars",
//       },
//       {
//         "question": "What is the currency of Japan?",
//         "options": ["Yuan", "Won", "Yen", "Ringgit"],
//         "correctAnswer": "Yen",
//       },
//       {
//         "question": "Who developed the theory of relativity?",
//         "options": ["Isaac Newton", "Albert Einstein", "Galileo Galilei", "Stephen Hawking"],
//         "correctAnswer": "Albert Einstein",
//       },
//       {
//         "question": "Which gas makes up the majority of Earth's atmosphere?",
//         "options": ["Oxygen", "Nitrogen", "Carbon Dioxide", "Argon"],
//         "correctAnswer": "Nitrogen",
//       },
//       {
//         "question": "What is the largest desert in the world?",
//         "options": ["Gobi Desert", "Sahara Desert", "Arabian Desert", "Antarctica"],
//         "correctAnswer": "Antarctica",
//       },
//       {
//         "question": "Who wrote '1984'?",
//         "options": ["George Orwell", "Aldous Huxley", "Ray Bradbury", "F. Scott Fitzgerald"],
//         "correctAnswer": "George Orwell",
//       },
//     ];
//
//     _questions = jsonData.map((item) => Question(
//       question: item['question'],
//       options: List<String>.from(item['options']),
//       correctAnswer: item['correctAnswer'],
//     )).toList();
//   }
//
//   Widget _buildOptions() {
//     if (_currentQuestionIndex < 0 || _currentQuestionIndex >= _questions.length) {
//       return Text('Invalid question index');
//     }
//
//     List<String> optionLetters = ['A', 'B', 'C', 'D'];
//
//     return Column(
//       children: _questions[_currentQuestionIndex].options
//           .asMap()
//           .map(
//             (index, option) => MapEntry(
//           index,
//           Column(
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Color(0xFF14ADFF), width: 2),                  color: _userAnswers[_currentQuestionIndex] == option
//                       ? Color(0xFF0FABFF) // Change the color to #0FABFF if the option is selected
//                       : Colors.white,
//                   borderRadius: BorderRadius.circular(29.0),
//                 ),
//                 child: ListTile(
//                   leading: Container(
//                     decoration: BoxDecoration(
//                       border: Border.all(color: Color(0xFF47B6F2), width: 2),                      shape: BoxShape.circle,
//                     ),
//                     child: CircleAvatar(
//                       backgroundColor: Colors.white,
//                       child: Text(
//                         optionLetters[index],
//                         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
//                       ),
//                     ),
//                   ),
//                   title: Text(
//                     option,
//                     style: TextStyle(
//                         color: _userAnswers[_currentQuestionIndex] == option
//                             ? Colors.black
//                             : Colors.black,
//                         fontWeight:_userAnswers[_currentQuestionIndex] == option? FontWeight.bold:FontWeight.normal,
//                         fontSize:_userAnswers[_currentQuestionIndex] == option? 16:13
//                     ),
//                   ),
//                   onTap: () {
//                     setState(() {
//                       _userAnswers[_currentQuestionIndex] = option;
//                       _moveToNextQuestion();
//                     });
//                   },
//                 ),
//               ),
//               SizedBox(height: 10),
//             ],
//           ),
//         ),
//       )
//           .values
//           .toList(),
//     );
//   }
//
//   void _moveToNextQuestion() {
//     Future.delayed(const Duration(milliseconds: 500), () {
//       setState(() {
//         if (_currentQuestionIndex < _questions.length - 1) {
//           _currentQuestionIndex++;
//         } else {
//           // Quiz is finished, navigate to the result page
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => ResultScreen(_calculateScore(), _questions.length),
//             ),
//           );
//         }
//       });
//     });
//   }
//
//   void _moveToPreviousQuestion() {
//     setState(() {
//       if (_currentQuestionIndex > 0) {
//         _currentQuestionIndex--;
//       }
//     });
//   }
//
//   int _calculateScore() {
//     int score = 0;
//     for (int i = 0; i < _questions.length; i++) {
//       if (_userAnswers.containsKey(i) && _userAnswers[i] == _questions[i].correctAnswer) {
//         score++;
//       }
//     }
//     return score;
//   }
//
//   @override
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue.shade100,
//       appBar: AppBar(
//         title: Text('Quiz',textAlign: TextAlign.center,),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             SizedBox(height: 10,),
//             Card(
//               elevation: 5,
//               shadowColor: Colors.grey,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(19.0),
//               ),
//               child: Column(
//                 children: [
//                   ClipRRect(
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(19.0),
//                       topRight: Radius.circular(19.0),
//                     ),
//                     child: Container(
//                       decoration: BoxDecoration(
//                         gradient: LinearGradient(
//                           begin: Alignment.centerLeft,
//                           end: Alignment.centerRight,
//                           colors: [
//                             Color(0xFF47B6F2), // #47B6F2
//                             Color(0xFF59C4FD), // #59C4FD
//                           ],
//                           stops: [0.0, 0.9031], // 0% and 90.31%
//                         ),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(19.0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               '${_currentQuestionIndex + 1}. ',
//                               style: TextStyle(fontSize: 31,fontFamily: 'Helvetica Neue',fontWeight: FontWeight.w500 ,color: Colors.white),
//
//
//                             ),
//                             SizedBox(width: 5,),
//                             Container(
//                               width: MediaQuery.of(context).size.width/1.5,
//                               child: Wrap(
//                                 children: [
//                                   Text(
//                                     '${_questions[_currentQuestionIndex].question}',
//                                     style: TextStyle(
//                                       fontSize: 18,
//                                       fontFamily: 'Lato',
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(19.0),
//                     child: _buildOptions(),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 20),
//             Padding(
//               padding: const EdgeInsets.only(right: 20,left: 20),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'Question ${_currentQuestionIndex + 1} of ${_questions.length}',
//                     style: TextStyle(fontSize: 16),
//                   ),
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: HexColor("##FFEF59"),
//                       elevation: 5, // Elevation to give the button a raised effect
//                       padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10.0),
//                       ),
//                     ),
//                     onPressed: _moveToPreviousQuestion,
//                     child: Text('Previous',style: TextStyle(color: Colors.black,fontFamily: 'Inter',fontWeight:FontWeight.bold,fontSize: 16 ),),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class ResultScreen extends StatelessWidget {
//   final int score;
//   final int totalQuestions;
//
//   ResultScreen(this.score, this.totalQuestions);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue.shade100,
//
//
//       appBar: AppBar(
//         title: Text('Quiz Result'),
//         backgroundColor: Colors.blue.shade300,
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             SizedBox(height: 50,),
//             Container(
//               width: MediaQuery.of(context).size.width-40,
//               height: MediaQuery.of(context).size.height/1.5,
//               child: Card(
//                 elevation: 5,
//                 shadowColor: Colors.grey,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12.0),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         'Thanks',
//                         style: GoogleFonts.rampartOne(
//                           fontSize: 22,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Text(
//                         'Thanks for participating in the quiz!',
//                         style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,fontFamily: 'Inter'),
//                         textAlign: TextAlign.center,
//                       ),
//                       SizedBox(height: 20),
//                       Image.network(
//                         'https://cdn-icons-png.flaticon.com/512/7518/7518748.png',height: 150,width: 150,
//
//                       ),
//                       SizedBox(height: 20),
//
//                       Text(
//                         'Result will be announced on 1st January',
//                         style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,fontFamily: 'Inter',color: Colors.lightGreen),
//                         textAlign: TextAlign.center,
//                       ),
//                       SizedBox(height: 10,),
//                       Text("Next Quiz will Start Tomorrow 2 PM",style: TextStyle(color: Colors.indigoAccent,fontWeight: FontWeight.bold),),
//                       SizedBox(height: 40),
//                       ElevatedButton(
//                         onPressed: () {
//                           // Handle the selfie button press
//                           // Navigator.pushNamed(context, "${dashboardroutename==""?"/dashBoard_6":dashboardroutename}");
//
//
//
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: HexColor("##FFEF59"),
//                           elevation: 5, // Elevation to give the button a raised effect
//                           padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10.0),
//                           ),
//                         ),
//                         child: Text('Add Selfee',style: TextStyle(color: Colors.black),),
//
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// class HexColor extends Color {
//   static int _getColorFromHex(String hexColor) {
//     hexColor = hexColor.toUpperCase().replaceAll("#", "");
//     if (hexColor.length == 6) {
//       hexColor = "FF" + hexColor;
//     }
//     return int.parse(hexColor, radix: 16);
//   }
//
//   HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
// }