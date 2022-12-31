import 'package:flutter/material.dart';
import 'package:myanimeapp/Providers/AnimesProvider.dart';
import 'package:provider/provider.dart';
import '../screens/AnimeDetail.dart';
import '../Models/anime.dart';

class AnimeWidget extends StatelessWidget {
  const AnimeWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final animeData = Provider.of<Anime>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          // Consumer is always listen
          leading: Consumer<Anime>(
            builder: (context, animeDatas, child) => IconButton(
              onPressed: () {
                animeData.favoriteStatus();
              },
              icon: (animeDatas.isFavorite)
                  ? const Icon(Icons.favorite)
                  : const Icon(Icons.favorite_border),
              color: Theme.of(context).colorScheme.secondary,
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

/*
so in order to make your app fast, you have to combine provider and consumer
1. we have to listen only widget that encounter a state or changing
2. so we set a provider to listen false because we do not render all of widget
3. only a widget inside consumer that changing cause we know consumer always listen

*/
