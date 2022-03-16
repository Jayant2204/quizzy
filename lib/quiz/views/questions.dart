import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quizzy/quiz/bloc/quiz_bloc.dart';
import 'package:quizzy/quiz/views/question/widgets/question_page_view.dart';
import 'package:quizzy/services/services.dart';

class QuestionPage extends StatelessWidget {
  const QuestionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuizBloc(
        RepositoryProvider.of<QuizService>(context),
        RepositoryProvider.of<ConnectivityService>(context),
      )..add(LoadApiEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Quizzy'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => context.go('/'),
          ),
        ),
        body: BlocBuilder<QuizBloc, QuizState>(
          builder: (context, QuizState state) {
            if (state is QuizLoadedState) {
              return QuestionPageView(questions: state.questions);
            } else if (state is QuizLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is QuizErrorState) {
              return Column(
                children: [
                  const Center(child: Text('Error loading questions')),
                  Center(child: Text(state.error)),
                ],
              );
            } else {
              return const Center(child: Text('Unknown state'));
            }
          },
        ),
      ),
    );
  }
}
