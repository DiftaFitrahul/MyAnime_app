import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:myanimeapp/Providers/AnimesProvider.dart';
import 'package:myanimeapp/Providers/Widgets/searchAnime.dart';
import 'package:provider/provider.dart';

import '../Models/anime.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 2, 23, 56),
        body: Consumer<AnimesProvider>(builder: (context, value, child) {
          if (value.isLoading) {
            return SizedBox(
              height: MediaQuery.of(context).size.height / 0.8,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          return const SearchAnimeItem();
        }));
  }
}
