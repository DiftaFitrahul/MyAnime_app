import 'package:flutter/material.dart';

class AnimeDetailScreen extends StatelessWidget {
  static const routeName = '/Anime-detail';
  const AnimeDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final animeId = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(title: const Text('Anime Detail')),
      body: Center(child: Text('This is an Anime of index $animeId')),
    );
  }
}
