import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:quizzy/quiz/models/quiz_model.dart';

class QuizService {
  Future<QuizQuestions> getQuizQuestions() async {
    try {
      final response = await Dio().get<Map<String, dynamic>>(
        'https://opentdb.com/api.php?amount=10&type=multiple',
      );
      return QuizQuestions.fromJson(response.data!);
    } on Exception catch (e) {
      log('Error while fetching quiz questions $e');
      rethrow;
    }
  }
}
