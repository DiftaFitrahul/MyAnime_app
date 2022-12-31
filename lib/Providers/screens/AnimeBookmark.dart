import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({Key key}) : super(key: key);
  static const routeName = '/Animes-bookmark';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Animes Bookmark")),
      body: Center(),
    );
  }
}
