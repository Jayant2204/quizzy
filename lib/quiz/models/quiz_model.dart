import 'package:json_annotation/json_annotation.dart';

part 'quiz_model.g.dart';

@JsonSerializable()
class QuizQuestions {
  QuizQuestions({
    required this.questions,
  });
  factory QuizQuestions.fromJson(Map<String, dynamic> json) =>
      _$QuizQuestionsFromJson(json);

  Map<String, dynamic> toJson() => _$QuizQuestionsToJson(this);

  @JsonKey(name: 'results')
  List<Question> questions;
}

@JsonSerializable()
class Question {
  Question({
    required this.question,
    required this.correctAnswer,
    required this.incorrectAnswers,
    this.category,
    this.difficulty,
    this.submittedAnswer,
  });

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionToJson(this);

  String question;
  String correctAnswer;
  List<String> incorrectAnswers;
  String? category;
  Difficulty? difficulty;

  @JsonKey(ignore: true)
  SubmittedAnswer? submittedAnswer;
}

enum Difficulty { easy, medium, hard }
enum SubmittedAnswer { correct, incorrect, skipped }
