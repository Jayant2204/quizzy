// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:quizzy/quiz/models/quiz_model.dart';
// import 'package:quizzy/quiz/views/result.dart';

// class QuizzScreen extends StatefulWidget {
//   const QuizzScreen({Key? key, required this.questions}) : super(key: key);

//   final List<Question> questions;

//   @override
//   State<QuizzScreen> createState() => _QuizzScreenState();
// }

// class _QuizzScreenState extends State<QuizzScreen> {
// //
//   int question_pos = 0;

//   int score = 0;

//   bool btnPressed = false;

//   late final PageController _controller = PageController();

//   String btnText = 'Next Question';

//   bool answered = false;

//   @override
//   void initState() {
//     super.initState();
//   }

//   Color optionFillColor(
//       {required int questionIndex, required int optionIndex}) {
//     if (btnPressed) {
//       return widget.questions[questionIndex].options[optionIndex] ==
//               widget.questions[questionIndex].correctAnswer
//           ? Colors.green.shade400
//           : Colors.red.shade400;
//     } else {
//       return Colors.transparent;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(18),
//         child: PageView.builder(
//           controller: _controller,
//           onPageChanged: (page) {
//             if (page == widget.questions.length - 1) {
//               setState(() {
//                 btnText = 'See Results';
//               });
//             }
//             setState(() {
//               answered = false;
//             });
//           },
//           physics: const NeverScrollableScrollPhysics(),
//           itemBuilder: (context, index) {
//             return Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 SizedBox(
//                   width: double.infinity,
//                   child: Text(
//                     'Question ${index + 1}/10',
//                     textAlign: TextAlign.start,
//                     style: const TextStyle(
//                       color: Colors.white,
//                       fontSize: 28,
//                     ),
//                   ),
//                 ),
//                 const Divider(
//                   color: Colors.white,
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 SizedBox(
//                   width: double.infinity,
//                   height: 200,
//                   child: Text(
//                     widget.questions[index].question,
//                     style: const TextStyle(
//                       color: Colors.white,
//                       fontSize: 22,
//                     ),
//                   ),
//                 ),
//                 for (int i = 0; i < widget.questions[index].options.length; 
// i++)
//                   Container(
//                     width: double.infinity,
//                     height: 50,
//                     margin: const EdgeInsets.only(
//                       bottom: 20,
//                       left: 12,
//                       right: 12,
//                     ),
//                     child: InkWell(
//                       onTap: !answered
//                           ? () {
//                               if (widget.questions[index].options[i] ==
//                                   widget.questions[index].correctAnswer) {
//                                 log('yes');
//                                 score++;
//                               } else {
//                                 log('no');
//                               }
//                               setState(() {
//                                 btnPressed = true;
//                                 answered = true;
//                               });
//                             }
//                           : null,
//                       child: AnimatedContainer(
//                         duration: const Duration(milliseconds: 300),
//                         decoration: BoxDecoration(
//                           border: Border.all(
//                             color: Colors.blueAccent,
//                           ),
//                           borderRadius: BorderRadius.circular(8),
//                           color: optionFillColor(
//                             questionIndex: index,
//                             optionIndex: i,
//                           ),
//                         ),
//                         child: Center(
//                           child: Text(
//                             widget.questions[index].options[i],
//                             style: const TextStyle(
//                               color: Colors.white,
//                               fontSize: 18,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 const SizedBox(
//                   height: 40,
//                 ),
//                 RawMaterialButton(
//                   onPressed: () {
//                     if (_controller.page?.toInt() ==
//                         widget.questions.length - 1) {
//                       Navigator.push<void>(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => ResultScreen(score),
//                         ),
//                       );
//                     } else {
//                       _controller.nextPage(
//                         duration: const Duration(milliseconds: 250),
//                         curve: Curves.easeInOut,
//                       );

//                       setState(() {
//                         btnPressed = false;
//                       });
//                     }
//                   },
//                   shape: const StadiumBorder(),
//                   fillColor: Colors.blue,
//                   padding: const EdgeInsets.all(18),
//                   elevation: 0,
//                   child: Text(
//                     btnText,
//                     style: const TextStyle(color: Colors.white),
//                   ),
//                 )
//               ],
//             );
//           },
//           itemCount: widget.questions.length,
//         ),
//       ),
//     );
//   }
// }
