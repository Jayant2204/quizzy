import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:quizzy/global/constants.dart';
import 'package:quizzy/quiz/models/quiz_model.dart';
import 'package:quizzy/quiz/views/question/widgets/question_card.dart';
import 'package:quizzy/quiz/views/result.dart';

class QuestionPageView extends StatefulWidget {
  const QuestionPageView({
    Key? key,
    required this.questions,
  }) : super(key: key);

  final List<Question> questions;

  @override
  State<QuestionPageView> createState() => _QuestionPageViewState();
}

class _QuestionPageViewState extends State<QuestionPageView> {
  int questionIndex = 0;
  int score = 0;

  late final List<Question> questions = widget.questions;

  final PageController _pageController = PageController();

  void onSubmitAnswer(int questionIndex, int optionIndex) {
    if (questions[questionIndex].options[optionIndex] ==
        questions[questionIndex].correctAnswer) {
      setState(() {
        score++;
        questions[questionIndex].submittedAnswer = SubmittedAnswer.correct;
      });
    }
    setState(() {
      questions[questionIndex].submittedAnswer = SubmittedAnswer.incorrect;
    });
  }

  void onNext() {
    if (questionIndex < questions.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
      setState(() {
        if (questions[questionIndex].submittedAnswer == null) {
          questions[questionIndex].submittedAnswer = SubmittedAnswer.skipped;
        }
        questionIndex++;
      });
    } else {
      Navigator.push<void>(
        context,
        MaterialPageRoute<void>(
          builder: (context) => ResultScreen(score),
        ),
      );
    }
  }

  void onPrevious() {
    if (questionIndex > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
      setState(() {
        questionIndex--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: kDefaultPadding),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Text.rich(
              TextSpan(
                text: 'Question ${questionIndex + 1}',
                style: Theme.of(context).textTheme.headline4,
                children: [
                  TextSpan(
                    text: '/${questions.length}',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ],
              ),
            ),
          ),
          const Divider(thickness: 1.5),
          const SizedBox(height: kDefaultPadding),
          Expanded(
            child: PageView.builder(
              // Block swipe to next qn
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              onPageChanged: (_) {
                log('changed');
              },
              itemCount: questions.length,
              itemBuilder: (context, index) => QuestionCard(
                question: questions[index],
                onSubmitAnswer: (optionIndex) =>
                    onSubmitAnswer(index, optionIndex),
                onNextQuestion: onNext,
                onPreviousQuestion: onPrevious,
                isLastQuestion: index == questions.length - 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
