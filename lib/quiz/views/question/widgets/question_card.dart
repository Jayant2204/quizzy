import 'package:flutter/material.dart';
import 'package:quizzy/global/constants.dart';
import 'package:quizzy/quiz/models/quiz_model.dart';

class QuestionCard extends StatefulWidget {
  const QuestionCard({
    Key? key,
    required this.question,
    required this.onSubmitAnswer,
    required this.onNextQuestion,
    required this.onPreviousQuestion,
    this.isLastQuestion = false,
  }) : super(key: key);

  final Question question;
  final void Function(int optionIndex) onSubmitAnswer;
  final void Function() onNextQuestion;
  final void Function() onPreviousQuestion;
  final bool isLastQuestion;

  @override
  State<QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Text(
            widget.question.question,
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(height: kDefaultPadding / 2),
          ...List.generate(
            widget.question.options.length,
            (index) => Option(
              index: index,
              text: widget.question.options[index],
              isCorrect: widget.question.correctAnswer ==
                  widget.question.options[index],
              submittedAnswer: widget.question.submittedAnswer,
              onPressed: () => widget.onSubmitAnswer(
                index,
              ),
            ),
          ),
          const Spacer(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: widget.onPreviousQuestion,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Center(child: Text('Previous')),
                  ),
                ),
                const SizedBox(width: kDefaultPadding),
                Expanded(
                  child: ElevatedButton(
                    onPressed: widget.onNextQuestion,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        widget.isLastQuestion ? 'Finish' : 'Next',
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Option extends StatelessWidget {
  const Option({
    Key? key,
    required this.text,
    required this.index,
    required this.onPressed,
    required this.isCorrect,
    this.submittedAnswer,
  }) : super(key: key);
  final String text;
  final int index;
  final VoidCallback onPressed;
  final bool isCorrect;
  final SubmittedAnswer? submittedAnswer;

  @override
  Widget build(BuildContext context) {
    final isAnswered =
        submittedAnswer != null && submittedAnswer != SubmittedAnswer.skipped;

    Color getTheRightColor() {
      if (isAnswered) {
        if (isCorrect) {
          return kGreenColor;
        } else {
          return kRedColor;
        }
      }
      return Colors.grey;
    }

    IconData getTheRightIcon() {
      return getTheRightColor() == kRedColor ? Icons.close : Icons.done;
    }

    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.only(top: kDefaultPadding),
        padding: const EdgeInsets.all(kDefaultPadding),
        decoration: BoxDecoration(
          border: Border.all(color: getTheRightColor()),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                '${index + 1}. $text ',
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
            Container(
              height: 26,
              width: 26,
              decoration: BoxDecoration(
                color: getTheRightColor() == kGrayColor
                    ? Colors.transparent
                    : getTheRightColor(),
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: getTheRightColor()),
              ),
              child: getTheRightColor() == Colors.grey
                  ? null
                  : Icon(getTheRightIcon(), size: 16),
            )
          ],
        ),
      ),
    );
  }
}
