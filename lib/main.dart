import 'package:flutter/material.dart';
import 'package:myanimeapp/Statefull/Models/anime.dart';
import 'package:provider/provider.dart';
import 'Providers/AnimesProvider.dart';
import 'Providers/screens/AnimeDetail.dart';
import 'Providers/screens/AnimeOverview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AnimesProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'List of Popular Anime',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.indigo)
              .copyWith(secondary: Colors.amber),
        ),
        home: const AnimeOverview(),
        routes: {AnimeDetailScreen.routeName: (context) => AnimeDetailScreen()},
      ),
    );
  }
}
//https://gogoanime.consumet.org/popular
/*
note:
learn spread Collection
learn fetch api using provider
learn state management provider

learn initState function is a function to inite some method or variable inside this function 
and it is called only once when the app is built


*/