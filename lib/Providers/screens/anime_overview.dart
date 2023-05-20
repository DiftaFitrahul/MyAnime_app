import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:myanimeapp/Providers/Widgets/NumberPaginator.dart';
import 'package:myanimeapp/Providers/animes_provider.dart';
import '../../components/animations/lottie_overlay.dart';
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
    final loadingOverview = Provider.of<AnimesProvider>(context).isLoading;
    if (loadingOverview) {
      Future.delayed(const Duration(milliseconds: 100)).then((value) {
        LottieOverlay.instance().show(context: context);
      });
    } else {
      Future.delayed(const Duration(seconds: 1)).then((value) {
        LottieOverlay.instance().hide(context: context);
      });
    }
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 2, 23, 56),
      appBar: AppBar(
        title: const Text("List of Popular Anime"),
        actions: [
          Consumer<BookMarkProvider>(
            builder: (context, value, icon) {
              return Badges(
                value: value.animeBookmark.length.toString(),
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
          child: const SingleChildScrollView(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            NumberPaginatorClass(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: AnimeGridView(),
            ),
          ],
        ),
      )),
    );
  }
}
