import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../animes_provider.dart';
import 'anime_items.dart';

class AnimeGridView extends StatefulWidget {
  const AnimeGridView({
    Key? key,
  }) : super(key: key);

  @override
  State<AnimeGridView> createState() => _AnimeGridViewState();
}

class _AnimeGridViewState extends State<AnimeGridView> {
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final allAnimes = Provider.of<AnimesProvider>(context).dataAnimes;
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        controller: _scrollController,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            mainAxisExtent: 300),
        itemCount: allAnimes.length,
        itemBuilder: (context, index) => ChangeNotifierProvider.value(
              value: allAnimes[index],
              child: AnimeWidget(idx: index),
            ));
  }
}
