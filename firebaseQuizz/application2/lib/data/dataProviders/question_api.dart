
import 'package:application2/data/models/question.dart';
import 'package:application2/data/repositories/question_repo.dart';
import 'package:application2/presentation/widgets/add_question_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class QuestionAPI {

  static  QuestionsRepository questionRef = new QuestionsRepository();


  //for add custom question
  static CollectionReference questionRef2 = FirebaseFirestore.instance.collection('Questions');



  static Future<void> getQuestionSync() async {
    QuerySnapshot query = await questionRef.getAllQuestions();
    List<QueryDocumentSnapshot> docs = query.docs;
    for (var doc in docs) {
      if (doc.data() != null) {
        var data = doc.data() as Map<String, dynamic>;
        QuizzQuestion.questionText.add(Question(
            question: data['question'],
            isCorrect: data['isCorrect'],
            imageURL: data['imageURL'],
            theme: data['theme']));
      }
    }
  }

  static Future<void> addQuestions(BuildContext context) {
    return questionRef2
        .add({
      'question': questionC.text,
      'isCorrect': stringToBool(isCorrectC.text),
      'imageURL': noURL(imageURLC.text),
      'theme': themeC.text
    })
        .then((value) => Alert(context: context,
      title: 'Question ajouté',
      desc: 'Vous pouvez cliquer sur retour !',).show())
        .catchError((error) => print("Failed to add question: $error"));
  }

}