import 'package:flutter/material.dart';
import 'package:myanimeapp/Providers/animes_search_provider.dart';
import 'package:myanimeapp/Providers/bookmark_provider.dart';
import 'package:myanimeapp/Providers/Page/home_page.dart';
import 'package:myanimeapp/Providers/screens/anime_bookmark.dart';
import 'package:provider/provider.dart';
import 'Providers/animes_provider.dart';
import 'Providers/screens/anime_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AnimesSearchProvider()),
        ChangeNotifierProvider(create: (context) => AnimesProvider()),
        ChangeNotifierProvider(create: (context) => BookMarkProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'List of Popular Anime',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.indigo)
              .copyWith(secondary: Colors.amber),
        ),
        home: const HomePage(),
        routes: {
          AnimeDetailScreen.routeName: (context) => const AnimeDetailScreen(),
          BookmarkScreen.routeName: (context) => const BookmarkScreen()
        },
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

learn today
1. MultiProvider
2. uodate (key, value) method
3. ifabsent method
4. scaffoldMesengger.of(contex).showSnackbar

*/

