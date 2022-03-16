import 'package:flutter/material.dart';
import 'package:quizzy/quiz/models/quiz_model.dart';
import 'package:quizzy/quiz/views/question/widgets/question_page_view.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({
    Key? key,
    required this.questions,
  }) : super(key: key);

  final List<Question> questions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // Fluttter show the back button automatically
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: QuestionPageView(questions: questions),
    );
  }
}
