import 'package:flutter/material.dart';
import 'package:myanimeapp/Models/bodyModels.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimeList(),
    );
  }
}
//https://gogoanime.consumet.org/popular