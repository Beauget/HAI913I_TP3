import 'package:application2/presentation/widgets/add_question_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewQuestion extends StatelessWidget {
  const NewQuestion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: const Text("Ajout question"),
      ),
      body: Center(
        child: addQuestion(context),
      ),
    );
  }
}