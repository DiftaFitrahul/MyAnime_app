import 'package:flutter/material.dart';
import 'package:myanimeapp/Providers/animes_provider.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:video_player/video_player.dart';

class AnimeDetailScreen extends StatefulWidget {
  static const routeName = '/Anime-detail';

  const AnimeDetailScreen({Key? key}) : super(key: key);

  @override
  State<AnimeDetailScreen> createState() => _AnimeDetailScreenState();
}

class _AnimeDetailScreenState extends State<AnimeDetailScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://c-an-ca2.betterstream.cc:2223/hls-playback/ad6c8c5a1545e84de2970bf862297f33ded39416473cf49c6642fac6628e3fd6d7792fa8edc551e621fced895ac921462f36f48ed0d2d18bb48f08f7245ff7ab76dc881ed808df784198df387521aaf3da1b93866ca3e7dfb7108e390c256d167760313c8dbb60263e686ecf18c30e144a3b0a3cc48310f12c86e85df6118fcde1a4441d7cdf738fd1336efcee50e553/index-f2-v1-a1.m3u8')
      ..initialize().then((_) {
        setState(() {});
      });
  }

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
    String genre = anime.genre.map((e) => e['name']).toList().join(', ');

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
                  _controller.value.isInitialized
                      ? AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          child: VideoPlayer(_controller),
                        )
                      : Container(
                          height: MediaQuery.of(context).size.height * 0.41,
                        ),
                  FloatingActionButton(
                      onPressed: () {
                        setState(() {
                          _controller.value.isPlaying
                              ? _controller.pause()
                              : _controller.play();
                        });
                      },
                      child: Icon(_controller.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow)),
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
                    Flexible(
                      child: ElevatedButton(
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
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Text(
                                        value.animeSelection[index].animeTitle,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 8),
                                      child: Text(
                                        value.animeSelection[index].releaseDate,
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
        ));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }
}

/*
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
                  */
