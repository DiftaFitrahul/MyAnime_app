import 'package:flutter/material.dart';
import 'package:myanimeapp/Providers/animes_provider.dart';

import 'package:provider/provider.dart';

import '../bookmark_provider.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({Key? key}) : super(key: key);
  static const routeName = '/Animes-bookmark';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 2, 23, 56),
      appBar: AppBar(title: const Text("Animes Bookmark")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("Your Bookmark List",
              style: TextStyle(color: Colors.white)),
          Consumer2<BookMarkProvider, AnimesProvider>(
              builder: (context, value, value2, child) {
            return Expanded(
                child: (value.idxBookMark.isEmpty)
                    ? const Text("Empty data",
                        style: TextStyle(color: Colors.white))
                    : ListView.builder(
                        itemCount: value.idxBookMark.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(value2
                                    .dataAnimes[value.idxBookMark[index]]
                                    .animeImg),
                              ),
                              title: Text(value2
                                  .dataAnimes[value.idxBookMark[index]]
                                  .animeTitle),
                              subtitle: Text(value2
                                  .dataAnimes[value.idxBookMark[index]]
                                  .releaseDate),
                              trailing: IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: (() {
                                  value2.bmStatus(value.idxBookMark[index]);
                                  value.removeAtIdxBookmark(index);
                                  //value.removeBookmark(animeBookmark[index]);
                                }),
                              ));
                        }));
          })
        ],
      ),
    );
  }

}

/*


*/