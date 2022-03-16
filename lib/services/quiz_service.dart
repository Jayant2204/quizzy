import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:quizzy/quiz/models/quiz_model.dart';

class QuizService {
  Future<QuizQuestions> getQuizQuestions() async {
    try {
      final response = await Dio().get<Object?>(
        'https://opentdb.com/api.php?amount=10&type=multiple',
      );

      if (response.data != null && response.data is Map<String, dynamic>) {
        return QuizQuestions.fromJson(response.data! as Map<String, dynamic>);
      }
      throw Exception('Failed to load Quiz Questions');
    } catch (e) {
      log('Error while fetching quiz questions $e');
      rethrow;
    }
  }
}
