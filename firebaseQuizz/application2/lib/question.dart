import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'add_question.dart';

@immutable
 class Question {
  String question;
  bool isCorrect;
  String imageURL;
  String theme;

  Question(
      {required this.question, required this.isCorrect, required this.imageURL, required this.theme});




 /* Question.fromJson(Map<String, Object?> json)
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
  }*/



  }


class QuizzQuestion {


  static List<Question> questionText = List.empty(growable: true);

 static CollectionReference questionRef = FirebaseFirestore.instance.collection('Questions');


 static Future<void> getQuestionSync() async {

   QuerySnapshot query = await questionRef.get();
   List<QueryDocumentSnapshot> docs = query.docs;
   for (var doc in docs) {
     if (doc.data() != null) {
       var data = doc.data() as Map<String, dynamic>;
       questionText.add(Question(
           question : data['question'], isCorrect : data['isCorrect'], imageURL : data['imageURL'],theme: data['theme']));
     }
   }
  }

  static Future<void> addQuestions() {
    return questionRef
        .add({
      'question': questionC.text,
      'isCorrect': stringToBool(isCorrectC.text),
      'imageURL': noURL(imageURLC.text),
      'theme' : themeC.text
    })
        .then((value) => getQuestionSync())
        .then((value) => reset())
        .catchError((error) => print("Failed to add user: $error"));
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
