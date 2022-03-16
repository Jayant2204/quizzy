import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen(this.score, {Key? key}) : super(key: key);
  final int score;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: double.infinity,
            child: Text(
              'Congratulations',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 45,
          ),
          const Text(
            'You Score is',
            style: TextStyle(color: Colors.white, fontSize: 34),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            '${widget.score}',
            style: const TextStyle(
              color: Colors.orange,
              fontSize: 85,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          TextButton(
            onPressed: () => context.go('/'),
            child: const Text(
              'Reapeat the quizz',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
