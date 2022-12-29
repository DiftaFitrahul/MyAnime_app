import 'package:flutter/material.dart';
import 'package:myanimeapp/Statefull/screens/AnimeDetail.dart';
import '../Service/fetchDataAnime.dart';
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
            icon: Icon(Icons.favorite_border_outlined),
            color: Theme.of(context).colorScheme.secondary,
          ),
          title: Text(datas[index].animeTitle),
          trailing: IconButton(
            onPressed: (() {}),
            color: Theme.of(context).colorScheme.secondary,
            icon: Icon(Icons.file_download_outlined),
          ),
        ),
        child: GestureDetector(
          onTap: (() {
            Navigator.of(context).pushNamed(AnimeDetailScreen.routeName,
                arguments: index.toString());
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
