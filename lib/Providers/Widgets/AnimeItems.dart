import 'package:flutter/material.dart';
import '../screens/AnimeDetail.dart';
import '../Models/anime.dart';

class AnimeWidget extends StatelessWidget {
  final List<Anime> datas;
  final int index;
  const AnimeWidget(this.datas, this.index, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_border_outlined),
            color: Theme.of(context).colorScheme.secondary,
          ),
          title: Text(datas[index].animeTitle),
          trailing: IconButton(
            onPressed: (() {}),
            color: Theme.of(context).colorScheme.secondary,
            icon: const Icon(Icons.file_download_outlined),
          ),
        ),
        child: GestureDetector(
          onTap: (() {
            Navigator.of(context).pushNamed(AnimeDetailScreen.routeName,
                arguments: datas[index].animeId);
          }),
          child: Image.network(
            datas[index].animeImg,
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
