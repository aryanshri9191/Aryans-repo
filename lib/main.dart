import 'package:flutter/material.dart';
import 'package:language_translator/language_translation.dart';


void main () {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Aryans Translator",
      color: Colors.amber,
      debugShowCheckedModeBanner: false,
      home: LanguageTranslationPage(),


    );
  }
}
