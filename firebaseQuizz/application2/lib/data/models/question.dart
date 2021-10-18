import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../../presentation/widgets/add_question_widget.dart';

@immutable
 class Question {
  String question;
  bool isCorrect;
  String imageURL;
  String theme;

  Question(
      {required this.question, required this.isCorrect, required this.imageURL, required this.theme});

  }


class QuizzQuestion {


  static List<Question> questionText = List.empty(growable: true);




  static int questionNumber = 0;

  static String getImage(){
      return questionText[questionNumber].imageURL;

  }



  static String getQuestion() {
    return questionText[questionNumber].question;
  }

  static bool getCorrectAnswer() {
    return questionText[questionNumber].isCorrect;
  }

  static String getTheme() {
    return questionText[questionNumber].theme;
  }

  static bool isFinished() {
    if (questionNumber >= questionText.length - 1)
      return true;
    else
      return false;
  }

  static void nextQuestion() {
    if (questionNumber < questionText.length - 1) {
      questionNumber++;
    }
  }

  static void reset() {
    questionNumber = 0;
  }






}
