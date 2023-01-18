import 'package:flutter/material.dart';
import "dart:math";
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:myanimeapp/Providers/AnimesProvider.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

import '../Models/anime.dart';

class AnimeDetailScreen extends StatelessWidget {
  static const routeName = '/Anime-detail';

  const AnimeDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final animeId = ModalRoute.of(context)?.settings.arguments as String;
    final dataAnime = Provider.of<AnimesProvider>(context, listen: false);
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
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.41,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(anime.animeImg),
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.41,
                    foregroundDecoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              Colors.transparent,
                              Color.fromARGB(255, 2, 23, 56)
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: [0.44, 1.0])),
                  ),
                  Positioned(
                    left: 12,
                    bottom: 0,
                    width: 350,
                    child: Text(
                      anime.animeTitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(left: 12, top: 8),
                child: Text(
                  'Action, Adventure, Shounen, Magic, Historical',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12, top: 15),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 17),
                      width: 160,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.amber[700],
                          borderRadius: BorderRadius.circular(10)),
                      child: Material(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.transparent,
                        child: InkWell(
                          splashColor: Colors.amber.shade400,
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, right: 10),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Text(
                                    'Play',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Icon(
                                    Icons.play_circle_outline_sharp,
                                    color: Colors.white,
                                    size: 40,
                                  )
                                ]),
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        dataAnime.favoriteStatusinDetailScreen(animeId);
                      },
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(vertical: 8)),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black)),
                      child: Consumer<AnimesProvider>(
                        builder: (context, value, child) => Icon(
                          value.dataAnimes
                                  .firstWhere(
                                      (element) => element.animeId == animeId)
                                  .isFavorite
                              ? Icons.favorite_outlined
                              : Icons.favorite_border_outlined,
                          color: Colors.red,
                          size: 31,
                        ),
                      ),
                    ),
                    const SizedBox(width: 17),
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(vertical: 8)),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black)),
                      child: const Icon(
                        Icons.file_download_outlined,
                        color: Colors.white,
                        size: 31,
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 12, top: 40),
                child: Text(
                  'Synopsis',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12, top: 8),
                child: SingleChildScrollView(
                  child: ReadMoreText(
                    lorem(paragraphs: 1, words: 100),
                    style: const TextStyle(color: Colors.white70),
                  ),
                ),
              ),
              const Padding(
                  padding: EdgeInsets.only(left: 12, top: 20),
                  child: Text(
                    "Today's Selection",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  )),
              SizedBox(
                height: 260,
                child: Padding(
                  padding: const EdgeInsets.only(left: 12, top: 10),
                  child: Consumer<AnimesProvider>(
                    builder: (context, value, child) => ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: value.animeSelection.length,
                        itemBuilder: ((context, index) => Container(
                              width: 140,
                              margin: const EdgeInsets.only(right: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(
                                        value.animeSelection[index].animeImg),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    value.animeSelection[index].animeTitle,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    value.animeSelection[index].releaseDate,
                                    style: const TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ))),
                  ),
                ),
              ),
              const SizedBox(
                height: 100,
              )
            ],
          ),
        ));
  }
}
