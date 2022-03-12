import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class QuizHomePage extends StatelessWidget {
  const QuizHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz'),
      ),
      body: Column(
        children: [
          const Center(
            child: Text('Quiz'),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () => context.go('/questions'),
            child: const Text('Start Quiz'),
          ),
          const SizedBox(height: 20)
        ],
      ),
    );
  }
}
