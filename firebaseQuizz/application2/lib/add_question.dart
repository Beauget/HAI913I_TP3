

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'question.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:application2/state/check_cubit.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:application2/question.dart';

TextEditingController questionC = TextEditingController();
TextEditingController isCorrectC =  TextEditingController();
TextEditingController imageURLC =  TextEditingController();
TextEditingController themeC =  TextEditingController();

Widget addQuestion(BuildContext context) {

  
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
         Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            controller: questionC,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Votre question ici',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            controller: isCorrectC,
            decoration: const InputDecoration(
              border:  OutlineInputBorder(),
              labelText: 'Vrai ou faux (true/false)',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            controller: imageURLC,
            decoration: const InputDecoration(
              border:  OutlineInputBorder(),
              labelText: 'url de l\'image',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            controller: themeC,
            decoration: const InputDecoration(
              border:  OutlineInputBorder(),
              labelText: 'theme',
            ),
          ),
        ),
        ElevatedButton(
            onPressed: () { QuizzQuestion.addQuestions(); },
            child:
              Text('Envoyez')
        ),
        ElevatedButton(
            onPressed: () { Navigator.pop(context); },
            child:
            Text('Retour')
        ),
      ],

    );
}


bool stringToBool(String val) {
  bool res; 
  if(val.toLowerCase() == "true") {
    res = true;
  }
  else {
    res = false;
  }
  return res;
}

String noURL(String val) {

  if(val.isEmpty) {
    val ="https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/1024px-No_image_available.svg.png";
  }
  return val;

}



