import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';
import 'package:quizzy/quiz/models/quiz_model.dart';
import 'package:quizzy/services/connectivity_service.dart';
import 'package:quizzy/services/quiz_service.dart';

part 'quiz_event.dart';
part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  QuizBloc(this._quizService, this._connectivityService)
      : super(QuizLoadingState()) {
    _connectivityService.connectivityStream.listen((event) {
      if (event == ConnectivityResult.none) {
        add(NoInternetEvent());
      } else {
        add(LoadApiEvent());
      }
    });
    on<LoadApiEvent>((event, emit) async {
      emit(QuizLoadingState());
      try {
        final quizQuestions = await _quizService.getQuizQuestions();
        emit(QuizLoadedState(questions: quizQuestions.questions));
      } catch (e) {
        emit(QuizErrorState(error: e.toString()));
      }
    });
    on<SubmitQuiz>((event, emit) {
      emit(QuizSubmittedState());
    });
    on<NoInternetEvent>((event, emit) {
      emit(HomeNoInternetState());
    });
  }

  final QuizService _quizService;
  final ConnectivityService _connectivityService;
}
