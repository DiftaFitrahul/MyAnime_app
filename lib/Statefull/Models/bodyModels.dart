import 'package:flutter/material.dart';
import '../Models/fetchDataAnime.dart';
import '../Service/anime.dart';

class AnimeList extends StatefulWidget {
  const AnimeList({Key key}) : super(key: key);

  @override
  State<AnimeList> createState() => _AnimeListState();
}

class _AnimeListState extends State<AnimeList> {
  Future<List<Anime>> futureAnime;

  @override
  void initState() {
    super.initState();
    futureAnime = FetchDataAnime.fetchAnime();
  }

  Column dataAnimes(List<Anime> datas, int index) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List of Popular Anime")),
      body: GestureDetector(
        child: FutureBuilder<List<Anime>>(
          future: futureAnime,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    mainAxisExtent: 300),
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return dataAnimes(snapshot.data, index);
                },
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return SizedBox(
              height: MediaQuery.of(context).size.height / 0.8,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
