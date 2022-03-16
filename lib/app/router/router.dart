import 'package:go_router/go_router.dart';
import 'package:quizzy/quiz/quiz.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const QuizHomePage(),
    ),
    GoRoute(
      path: '/questions',
      builder: (context, state) => const QuestionPage(),
    ),
  ],
);
