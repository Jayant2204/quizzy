// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuizQuestions _$QuizQuestionsFromJson(Map<String, dynamic> json) =>
    QuizQuestions(
      questions: (json['results'] as List<dynamic>)
          .map((dynamic e) => Question.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuizQuestionsToJson(QuizQuestions instance) =>
    <String, dynamic>{
      'results': instance.questions,
    };

Question _$QuestionFromJson(Map<String, dynamic> json) => Question(
      question: json['question'] as String,
      correctAnswer: json['correctAnswer'] as String,
      incorrectAnswers: (json['incorrectAnswers'] as List<dynamic>)
          .map((dynamic e) => e as String)
          .toList(),
      category: json['category'] as String?,
      difficulty: $enumDecodeNullable(_$DifficultyEnumMap, json['difficulty']),
    );

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      'question': instance.question,
      'correctAnswer': instance.correctAnswer,
      'incorrectAnswers': instance.incorrectAnswers,
      'category': instance.category,
      'difficulty': _$DifficultyEnumMap[instance.difficulty],
    };

const _$DifficultyEnumMap = {
  Difficulty.easy: 'easy',
  Difficulty.medium: 'medium',
  Difficulty.hard: 'hard',
};
