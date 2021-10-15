import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

@immutable
 class Question {
  String question;
  bool isCorrect;
  String imageURL;

  Question(
      {required this.question, required this.isCorrect, required this.imageURL});




  Question.fromJson(Map<String, Object?> json)
      : this(
    question: json['question']! as String,
    isCorrect: json['isCorrect']! as bool,
    imageURL: json['imageURL']! as String,
  );

  Map<String, Object?> toJson() {
    return {
      'question': question,
      'isCorrect': isCorrect,
      'imageURL': imageURL,
    };
  }



  }


 // Question 1  = await questionRef.doc('1').get().then((snapshot) => snapshot.data()!);


class QuizzQuestion {


  static List<Question> questionText = List.empty(growable: true);

  static final questionRef = FirebaseFirestore.instance.collection('Questions').withConverter<Question>(
    fromFirestore: (snapshot, _) => Question.fromJson(snapshot.data()!),
    toFirestore: (question, _) => question.toJson(),
  );

 static Future<void> getQuestionSync() async {


    Question x = await questionRef.doc('9BaUgLf8GalWJqrgB58g').get().then((snapshot) => snapshot.data()!);
    Question x1 = await questionRef.doc('Du0zhWAlMbSGWN84K4AY').get().then((snapshot) => snapshot.data()!);
    Question x2 = await questionRef.doc('isEZFRnGNN0ewQUdGiXb').get().then((snapshot) => snapshot.data()!);
    Question x3 = await questionRef.doc('jeRMBx3jndUPDpCmSYUo').get().then((snapshot) => snapshot.data()!);
    Question x4 = await questionRef.doc('mDYtCyUfzRmO6bX7bdg6').get().then((snapshot) => snapshot.data()!);


    QuizzQuestion.questionText.add(x);
    QuizzQuestion.questionText.add(x1);
    QuizzQuestion.questionText.add(x2);
    QuizzQuestion.questionText.add(x3);
    QuizzQuestion.questionText.add(x4);

  }

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
