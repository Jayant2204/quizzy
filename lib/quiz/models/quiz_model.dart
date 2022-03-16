class QuizQuestions {
  QuizQuestions({
    required this.questions,
  });
  factory QuizQuestions.fromJson(Map<String, dynamic> json) => QuizQuestions(
        questions: (json['results'] as List<dynamic>)
            .map((dynamic e) => Question.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'results': questions,
      };

  List<Question> questions;
}

class Question {
  Question({
    required this.question,
    required this.correctAnswer,
    required this.incorrectAnswers,
    this.category,
    this.difficulty,
    this.submittedAnswer,
    required this.options,
  });

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        question: json['question'] as String,
        correctAnswer: json['correct_answer'] as String,
        incorrectAnswers: (json['incorrect_answers'] as List<dynamic>)
            .map((dynamic e) => e as String)
            .toList(),
        category: json['category'] as String?,
        options: ((json['incorrect_answers'] as List<dynamic>)
            .map(
              (dynamic e) => e as String,
            )
            .toList()
          ..add(
            json['correct_answer'] as String,
          ))
          ..shuffle(),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'question': question,
        'correctAnswer': correctAnswer,
        'incorrectAnswers': incorrectAnswers,
        'category': category,
      };

  String question;
  String correctAnswer;
  List<String> incorrectAnswers;
  List<String> options;
  String? category;
  Difficulty? difficulty;

  SubmittedAnswer? submittedAnswer;
}

enum Difficulty { easy, medium, hard }
enum SubmittedAnswer { correct, incorrect, skipped }
