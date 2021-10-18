import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionsRepository {
  static var _questionFirebase = FirebaseFirestore.instance.collection("Questions");

  Future<QuerySnapshot> getAllQuestions() {
    return _questionFirebase.get();
  }

  Future<QuerySnapshot> getQuestionsFromTheme(String theme){
    return _questionFirebase.where("theme",isEqualTo: theme).get();
  }

  Future<DocumentReference> addQuestion(Map<String,dynamic> question){
    return _questionFirebase.add(question);
  }
}

