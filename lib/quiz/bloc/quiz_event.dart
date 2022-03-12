part of 'quiz_bloc.dart';

@immutable
abstract class QuizEvent {}

class LoadApiEvent extends QuizEvent {}

class NoInternetEvent extends QuizEvent {}

class SubmitQuiz extends QuizEvent {}
