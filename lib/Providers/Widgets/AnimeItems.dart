import 'package:flutter/material.dart';
import 'package:myanimeapp/Providers/AnimesProvider.dart';
import 'package:provider/provider.dart';
import '../screens/AnimeDetail.dart';
import '../Models/anime.dart';

class AnimeWidget extends StatelessWidget {
  const AnimeWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final animeData = Provider.of<Anime>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: IconButton(
            onPressed: () {
              animeData.favoriteStatus();
            },
            icon: (animeData.isFavorite)
                ? const Icon(Icons.favorite)
                : const Icon(Icons.favorite_border),
            color: Theme.of(context).colorScheme.secondary,
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
          trailing: IconButton(
            onPressed: (() {}),
            color: Theme.of(context).colorScheme.secondary,
            icon: const Icon(Icons.file_download_outlined),
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
