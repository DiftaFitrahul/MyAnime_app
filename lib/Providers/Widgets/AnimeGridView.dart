import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../AnimesProvider.dart';
import './AnimeItems.dart';

class AnimeGridView extends StatelessWidget {
  const AnimeGridView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final animesData = Provider.of<AnimesProvider>(context);
    final allAnimes = animesData.dataAnimes;
    return GridView.builder(
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
