import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:myanimeapp/Statefull/Widgets/bodyModels.dart';

import '../Service/fetchDataAnime.dart';
import '../Models/anime.dart';

class AnimeOverview extends StatefulWidget {
  const AnimeOverview({Key key}) : super(key: key);

  @override
  State<AnimeOverview> createState() => _AnimeOverviewState();
}

class _AnimeOverviewState extends State<AnimeOverview> {
  Future<List<Anime>> futureAnime;

  //this method to initialize the service
  //initState Method just call once when the application is being built
  @override
  void initState() {
    super.initState();
    futureAnime = FetchDataAnime.fetchAnime();
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
                  return AnimeWidget(snapshot.data, index);
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
