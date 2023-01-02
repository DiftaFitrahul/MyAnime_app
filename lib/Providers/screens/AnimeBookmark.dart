import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:provider/provider.dart';

import '../Models/anime.dart';
import '../BookmarkProvider.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({Key key}) : super(key: key);
  static const routeName = '/Animes-bookmark';

  @override
  Widget build(BuildContext context) {
    final listBookmark = Provider.of<BookMarkProvider>(context, listen: false);
    //List<Map<String, dynamic>> animeBookmark = [];

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 2, 23, 56),
      appBar: AppBar(title: const Text("Animes Bookmark")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("Your Bookmark List",
              style: TextStyle(color: Colors.white)),
          Consumer2<BookMarkProvider, Anime>(
              builder: (context, value, value2, child) {
            final animeBookmark =
                listBookmark.bookMark.keys.toList(growable: false);
            return Expanded(
                child: (animeBookmark.isEmpty)
                    ? const Text("Empty data",
                        style: TextStyle(color: Colors.white))
                    : ListView.builder(
                        itemCount: listBookmark.bookmarkLength,
                        itemBuilder: (context, index) {
                          return ListTile(
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(listBookmark
                                    .bookMark[animeBookmark[index]].imageUrl),
                              ),
                              title: Text(listBookmark
                                  .bookMark[animeBookmark[index]].title),
                              subtitle: Text(listBookmark
                                  .bookMark[animeBookmark[index]].releaseDate),
                              trailing: IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: (() {
                                  //value2.isBookmark == false;

                                  value.removeBookmark(animeBookmark[index]);
                                }),
                              ));
                        }));
          })
        ],
      ),
    );
  }

  Widget deleteBook() {}
}

/*


*/