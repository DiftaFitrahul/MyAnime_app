import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:myanimeapp/Providers/AnimesProvider.dart';
import 'package:myanimeapp/Providers/Widgets/AnimeGridView.dart';
import 'package:provider/provider.dart';
import '../Widgets/AnimeItems.dart';

import '../Service/fetchDataAnime.dart';
import '../Models/anime.dart';

class AnimeOverview extends StatefulWidget {
  const AnimeOverview({Key key}) : super(key: key);

  @override
  State<AnimeOverview> createState() => _AnimeOverviewState();
}

class _AnimeOverviewState extends State<AnimeOverview> {
  @override
  void initState() {
    super.initState();
    Provider.of<AnimesProvider>(context, listen: false).getAllAnimes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("List of Popular Anime")),
      body: GestureDetector(child: Consumer<AnimesProvider>(
        builder: (context, value, child) {
          if (value.isLoading) {
            return SizedBox(
              height: MediaQuery.of(context).size.height / 0.8,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          return const AnimeGridView();
        },
      )),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
