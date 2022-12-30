import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:myanimeapp/Providers/AnimesProvider.dart';
import 'package:provider/provider.dart';

class AnimeDetailScreen extends StatelessWidget {
  static const routeName = '/Anime-detail';

  const AnimeDetailScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final animeId = ModalRoute.of(context).settings.arguments as String;
    final anime = Provider.of<AnimesProvider>(context).dataAnimes.firstWhere(
      (animes) {
        return animes.animeId == animeId;
      },
    );
    return Scaffold(
      appBar: AppBar(title: Text(anime.animeTitle)),
      body: Center(child: Text('This is an Anime of index ${anime.animeImg}')),
    );
  }
}
