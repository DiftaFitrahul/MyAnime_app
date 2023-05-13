import 'package:flutter/material.dart';
import 'package:myanimeapp/Providers/Widgets/NumberPaginator.dart';
import 'package:myanimeapp/Providers/animes_provider.dart';
import '../bookmark_provider.dart';
import 'package:myanimeapp/Providers/Widgets/anime_grid_view.dart';
import 'package:myanimeapp/Providers/screens/anime_bookmark.dart';
import 'package:provider/provider.dart';
import '../Widgets/badges.dart';

class AnimeOverview extends StatefulWidget {
  const AnimeOverview({Key? key}) : super(key: key);

  @override
  State<AnimeOverview> createState() => _AnimeOverviewState();
}

class _AnimeOverviewState extends State<AnimeOverview> {
  @override
  void initState() {
    super.initState();
    Provider.of<AnimesProvider>(context, listen: false).firstGetAllAnimes();
  }

  @override
  Widget build(BuildContext context) {
    final loadingOverviewPage = Provider.of<AnimesProvider>(context).isLoading;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 2, 23, 56),
      appBar: AppBar(
        title: const Text("List of Popular Anime"),
        actions: [
          Consumer<BookMarkProvider>(
            builder: (context, value, icon) {
              return Badges(
                value: value.idxBookMark.length.toString(),
                child: icon ??
                    IconButton(
                      icon: const Icon(Icons.bookmarks_outlined),
                      onPressed: (() {
                        Navigator.of(context)
                            .pushNamed(BookmarkScreen.routeName);
                      }),
                    ),
              );
            },
            child: IconButton(
              icon: const Icon(Icons.bookmarks_outlined),
              onPressed: (() {
                Navigator.of(context).pushNamed(BookmarkScreen.routeName);
              }),
            ),
          ),
        ],
      ),
      body: GestureDetector(
          child: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const NumberPaginatorClass(),
            loadingOverviewPage
                ? const Center(child: CircularProgressIndicator())
                : const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: AnimeGridView(),
                  ),
          ],
        ),
      )),
    );
  }
}
