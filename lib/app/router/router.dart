import 'package:go_router/go_router.dart';
import 'package:quizzy/counter/counter.dart';
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
    GoRoute(
      path: '/counter',
      builder: (context, state) => const CounterPage(),
    ),
  ],
);
