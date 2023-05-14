import 'package:flutter/material.dart';
import 'package:myanimeapp/Providers/Models/collection_type.dart';
import 'package:myanimeapp/Providers/animes_provider.dart';
import 'package:myanimeapp/Providers/animes_search_provider.dart';
import 'package:myanimeapp/Providers/bookmark_provider.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../Models/anime.dart';

class AnimeDetailScreen extends StatefulWidget {
  static const routeName = '/Anime-detail';

  const AnimeDetailScreen({Key? key}) : super(key: key);

  @override
  State<AnimeDetailScreen> createState() => _AnimeDetailScreenState();
}

class _AnimeDetailScreenState extends State<AnimeDetailScreen> {
  bool ytIsPlay = false;
  bool ready = false;

  late YoutubePlayerController _controller;

  @override
  void initState() {
    _controller = YoutubePlayerController(initialVideoId: '');
    super.initState();
  }

  void initPlayer(String youtubeUrl) {
    final videoId = YoutubePlayer.convertUrlToId(youtubeUrl) ?? '';

    _controller = YoutubePlayerController(
        initialVideoId: videoId,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
        ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final collectionType =
        ModalRoute.of(context)?.settings.arguments as CollectionAnimeType;
    final dataAnime = Provider.of<AnimesProvider>(context, listen: false);
    late Anime anime;
    switch (collectionType.type) {
      case AnimeCollection.home:
        anime = Provider.of<AnimesProvider>(context, listen: false)
            .dataAnimes
            .firstWhere(
          (animes) {
            return animes.animeId == collectionType.id;
          },
        );
        break;
      case AnimeCollection.bookmark:
        anime = Provider.of<BookMarkProvider>(context, listen: false)
            .animeBookmark
            .firstWhere(
          (animes) {
            return animes.animeId == collectionType.id;
          },
        );
        break;
      case AnimeCollection.search:
        anime = Provider.of<AnimesSearchProvider>(context, listen: false)
            .animesSearch
            .firstWhere(
          (animes) {
            return animes.animeId == collectionType.id;
          },
        );
        break;
    }

    String genre = anime.genre.map((e) => e['name']).toList().join(', ');

    return WillPopScope(
      onWillPop: () async {
        setState(() {
          ytIsPlay = false;
        });
        return true;
      },
      child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 2, 23, 56),
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  setState(() {
                    ytIsPlay = false;
                  });
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back)),
            title: Text(anime.animeTitle),
            automaticallyImplyLeading: false,
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ytIsPlay
                    ? SizedBox(
                        //height: MediaQuery.of(context).size.height * 0.31,
                        child: YoutubePlayer(
                          controller: _controller,
                          showVideoProgressIndicator: true,
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          setState(() {
                            ytIsPlay = true;
                            initPlayer(anime.trailer);
                          });
                        },
                        child: Stack(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.30,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(anime.animeImg),
                                ),
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.31,
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
                              top: 0,
                              left: 0,
                              right: 0,
                              bottom: 40,
                              child: Icon(Icons.play_arrow,
                                  color: Colors.white.withOpacity(0.9),
                                  size: 80),
                            )
                          ],
                        ),
                      ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 12,
                  ),
                  child: Text(
                    anime.animeTitle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12, top: 8),
                  child: Text(
                    genre,
                    style: const TextStyle(color: Colors.grey),
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
                            child: const Padding(
                              padding: EdgeInsets.only(left: 20, right: 10),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
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
                      Flexible(
                        child: ElevatedButton(
                          onPressed: () {
                            dataAnime.favoriteStatusinDetailScreen(
                                collectionType.id);
                          },
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                  const EdgeInsets.symmetric(vertical: 8)),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.black)),
                          child: Consumer3<AnimesProvider, BookMarkProvider,
                                  AnimesSearchProvider>(
                              builder:
                                  (context, animes, bookmars, search, child) {
                            switch (collectionType.type) {
                              case AnimeCollection.home:
                                return getIconAnime(
                                    animes.dataAnimes, collectionType.id);
                              case AnimeCollection.bookmark:
                                return getIconAnime(
                                    bookmars.animeBookmark, collectionType.id);
                              case AnimeCollection.search:
                                return getIconAnime(
                                    search.animesSearch, collectionType.id);
                            }
                          }),
                        ),
                      ),
                      const SizedBox(width: 17),
                      Flexible(
                        child: ElevatedButton(
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
                      anime.synopsis,
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
                  height: 290,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12, top: 10),
                    child: Consumer<AnimesProvider>(
                      builder: (context, value, child) => ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: value.animeSelection.length,
                          itemBuilder: ((context, index) => Container(
                                //decoration: BoxDecoration(color: Colors.amber),
                                width: 160,
                                margin: const EdgeInsets.only(right: 15),
                                child: IntrinsicHeight(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Expanded(
                                        child: Image(
                                          fit: BoxFit.fill,
                                          image: NetworkImage(value
                                              .animeSelection[index].animeImg),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: Text(
                                          value
                                              .animeSelection[index].animeTitle,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 8),
                                        child: Text(
                                          value.animeSelection[index]
                                              .releaseDate,
                                          style: const TextStyle(
                                              color: Colors.grey,
                                              overflow: TextOverflow.ellipsis),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ))),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }

  Icon getIconAnime(List anime, int id) {
    return Icon(
      anime.firstWhere((element) => element.animeId == id).isFavorite
          ? Icons.favorite_outlined
          : Icons.favorite_border_outlined,
      color: Colors.red,
      size: 31,
    );
  }
}

/*

                  
                  */
