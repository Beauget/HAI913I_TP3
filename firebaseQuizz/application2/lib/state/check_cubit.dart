import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../question.dart';

part 'check_state.dart';

class CheckCubit extends Cubit<CheckState> {
  int questionNumber = 0;
  int score = 0;

  CheckCubit() : super(CheckInitial(0, 0));

  void checkAnswer(bool userPickedAnswer, BuildContext context) {
    bool correctAnswer = QuizzQuestion.getCorrectAnswer();

    if (QuizzQuestion.isFinished() == true) {
      Alert(
        context: context,
        title: 'Finit',
        desc: 'Votre score est de ' + score.toString(),
      ).show();
      QuizzQuestion.reset();
      emit(CheckInitial(questionNumber, score));
      score = 0;
    } else {
      if (userPickedAnswer == correctAnswer) {
        score = score + 1;
      }
      QuizzQuestion.nextQuestion();
      emit(CheckInitial(questionNumber, score));
    }
  }

  void checkAnswerNext(BuildContext context) {
    bool correctAnswer = QuizzQuestion.getCorrectAnswer();

    if (QuizzQuestion.isFinished() == true) {
      Alert(
        context: context,
        title: 'Finit',
        desc: 'Votre score est de ' + score.toString(),
      ).show();
      QuizzQuestion.reset();
      emit(CheckInitial(questionNumber, score));
      score = 0;
    } else {
      QuizzQuestion.nextQuestion();
      emit(CheckInitial(questionNumber, score));
    }
  }
}