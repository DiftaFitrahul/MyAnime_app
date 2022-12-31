import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:myanimeapp/Providers/BookmarkProvider.dart';
import 'package:provider/provider.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({Key key}) : super(key: key);
  static const routeName = '/Animes-bookmark';

  @override
  Widget build(BuildContext context) {
    final listBookmark = Provider.of<BookMarkProvider>(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 2, 23, 56),
      appBar: AppBar(title: const Text("Animes Bookmark")),
      body: Column(
        children: [
          Text("Your Bookmark List"),
          Expanded(
              child: ListView.builder(
                  itemCount: listBookmark.bookmarkLength,
                  itemBuilder: (context, index) {}))
        ],
      ),
    );
  }
}
