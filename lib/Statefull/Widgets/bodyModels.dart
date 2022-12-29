import 'package:flutter/material.dart';
import '../Service/fetchDataAnime.dart';
import '../Models/anime.dart';

class AnimeWidget extends StatelessWidget {
  final List<Anime> datas;
  final int index;
  const AnimeWidget(this.datas, this.index, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 230,
          width: 170,
          child: Image(
              fit: BoxFit.cover, image: NetworkImage(datas[index].animeImg)),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          datas[index].animeTitle,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
