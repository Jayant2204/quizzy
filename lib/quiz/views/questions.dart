import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizzy/quiz/bloc/quiz_bloc.dart';
import 'package:quizzy/quiz/models/quiz_model.dart';
import 'package:quizzy/services/services.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({Key? key}) : super(key: key);

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuizBloc(
        RepositoryProvider.of<QuizService>(context),
        RepositoryProvider.of<ConnectivityService>(context),
      )..add(LoadApiEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Question'),
        ),
        body: BlocBuilder<QuizBloc, QuizState>(
          builder: (context, QuizState state) {
            if (state is QuizLoadedState) {
              return _QuestionsView(questions: state.questions);
            } else if (state is QuizLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return const Center(child: Text('Error'));
            }
          },
        ),
      ),
    );
  }
}

class _QuestionsView extends StatefulWidget {
  const _QuestionsView({Key? key, required this.questions}) : super(key: key);

  final List<Question> questions;

  @override
  State<_QuestionsView> createState() => __QuestionsViewState();
}

class __QuestionsViewState extends State<_QuestionsView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => _QuestionItem(
        question: widget.questions[index],
      ),
    );
  }
}

class _QuestionItem extends StatelessWidget {
  const _QuestionItem({Key? key, required this.question}) : super(key: key);

  final Question question;

  @override
  Widget build(BuildContext context) {
    final options = <String>[];
    options.addAll(question.incorrectAnswers);
    options.add(question.correctAnswer);
    options.shuffle();
    return ListTile(
      title: Text(question.question),
      subtitle: Column(
        children:
            List.generate(options.length, (index) => Text(options[index])),
      ),
    );
  }
}
