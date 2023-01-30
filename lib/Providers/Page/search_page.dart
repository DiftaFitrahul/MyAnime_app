import 'package:flutter/material.dart';
import 'package:myanimeapp/Providers/animes_provider.dart';
import 'package:myanimeapp/Providers/Widgets/search_anime.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
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
          })),
    );
  }
}
