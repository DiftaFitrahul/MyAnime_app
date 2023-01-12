import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:myanimeapp/Providers/AnimesProvider.dart';
import 'package:provider/provider.dart';

class AnimeDetailScreen extends StatelessWidget {
  static const routeName = '/Anime-detail';

  const AnimeDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final animeId = ModalRoute.of(context)?.settings.arguments as String;
    final anime = Provider.of<AnimesProvider>(context, listen: false)
        .dataAnimes
        .firstWhere(
      (animes) {
        return animes.animeId == animeId;
      },
    );
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 2, 23, 56),
      appBar: AppBar(title: Text(anime.animeTitle)),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.45,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(anime.animeImg),
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.45,
                foregroundDecoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          Color.fromARGB(255, 2, 23, 56)
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.6, 1.0])),
              ),
              Positioned(
                
                child: Text(
                  anime.animeTitle,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          Center(child: Text('This is an Anime of index ${anime.animeImg}')),
        ],
      ),
    );
  }
}
