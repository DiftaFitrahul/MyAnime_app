import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AnimeDetailScreen extends StatelessWidget {
  static const routeName = '/Anime-detail';
  const AnimeDetailScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AnimeId = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(title: Text('Anime Detail')),
      body: Center(child: Text('This is an Anime of index $AnimeId')),
    );
  }
}
