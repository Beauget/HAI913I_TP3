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


class QuizzQuestion {


  static List<Question> questionText = List.empty(growable: true);

  static final questionRef = FirebaseFirestore.instance.collection('Questions').withConverter<Question>(
    fromFirestore: (snapshot, _) => Question.fromJson(snapshot.data()!),
    toFirestore: (question, _) => question.toJson(),
  );

 static Future<void> getQuestionSync() async {

   CollectionReference questionRef = FirebaseFirestore.instance.collection('Questions');


   QuerySnapshot query = await questionRef.get();
   List<QueryDocumentSnapshot> docs = query.docs;
   for (var doc in docs) {
     if (doc.data() != null) {
       var data = doc.data() as Map<String, dynamic>;
       questionText.add(Question(
           question : data['question'], isCorrect : data['isCorrect'], imageURL : data['imageURL']));
     }
   }
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
