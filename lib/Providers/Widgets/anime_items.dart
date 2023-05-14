import 'package:flutter/material.dart';
import 'package:myanimeapp/Providers/animes_provider.dart';
import 'package:provider/provider.dart';

import '../bookmark_provider.dart';
import '../screens/anime_detail.dart';
import '../Models/anime.dart';

class AnimeWidget extends StatelessWidget {
  const AnimeWidget({Key? key, required this.idx}) : super(key: key);
  final int idx;

  @override
  Widget build(BuildContext context) {
    final animeData = Provider.of<Anime>(context, listen: false);
    final bookmarkResult =
        Provider.of<BookMarkProvider>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          // Consumer is always listen
          leading: Consumer2<AnimesProvider, BookMarkProvider>(
            builder: (context, anime, bookmark, child) => IconButton(
              onPressed: () {
                anime.favoriteStatus(idx);
              },
              icon: (anime.dataAnimes[idx].isFavorite)
                  ? const Icon(Icons.favorite)
                  : const Icon(Icons.favorite_border),
              color: Colors.amber,
            ),
          ),
          title: TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AnimeDetailScreen.routeName,
                  arguments: animeData.animeId);
            },
            child: Text(
              animeData.animeTitle,
              style: const TextStyle(
                  fontSize: 12,
                  overflow: TextOverflow.ellipsis,
                  color: Colors.white),
            ),
          ),
          //so we get data in animes provider and change the status in animes provider
          trailing: Consumer2<AnimesProvider, BookMarkProvider>(
            builder: (context, anime, bookmark, child) => IconButton(
                onPressed: (() {
                  anime.bmStatus(idx);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: (anime.dataAnimes[idx].isBookmark == false)
                        ? const Text("succesfully removed")
                        : const Text("succesfully added"),
                    duration: const Duration(milliseconds: 600),
                  ));
                  if (bookmarkResult.animeIdBookmark
                      .contains(anime.dataAnimes[idx].animeId)) {
                    bookmarkResult.removeBookmark(anime.dataAnimes[idx]);
                  } else {
                    bookmarkResult
                        .addIdxBookmark(anime.dataAnimes[idx].animeId);
                    bookmarkResult.getBookmarkAnime();
                  }
                }),
                color: Colors.amber,
                icon: (bookmark.animeIdBookmark
                        .contains(anime.dataAnimes[idx].animeId))
                    ? const Icon(Icons.bookmark)
                    : const Icon(Icons.bookmark_border)),
          ),
        ),
        child: GestureDetector(
          onTap: (() {
            Navigator.of(context).pushNamed(AnimeDetailScreen.routeName,
                arguments: animeData.animeId);
          }),
          child: Image.network(
            animeData.animeImg,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

// const SizedBox(
//           height: 10,
//         ),
//         Text(
//           datas[index].animeTitle,
//           textAlign: TextAlign.center,
//           style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
//         )

/*
so in order to make your app fast, you have to combine provider and consumer
1. we have to listen only widget that encounter a state or changing
2. so we set a provider to listen false because we do not render all of widget
3. only a widget inside consumer that changing cause we know consumer always listen

*/
