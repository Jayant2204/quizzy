part of 'quiz_bloc.dart';

@immutable
abstract class QuizState {}

class QuizLoadingState extends QuizState {}

class QuizLoadedState extends QuizState {
  QuizLoadedState({required this.questions});
  final List<Question> questions;
}

class QuizSubmittedState extends QuizState {}

class HomeNoInternetState extends QuizState {}
