import 'package:flutter/material.dart';
import './Statefull/screens/AnimeOverview.dart';
import './Statefull/screens/AnimeDetail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'List of Popular Anime',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.indigo)
            .copyWith(secondary: Colors.amber),
      ),
      home: AnimeOverview(),
      routes: {AnimeDetailScreen.routeName: (context) => AnimeDetailScreen()},
    );
  }
}
//https://gogoanime.consumet.org/popular