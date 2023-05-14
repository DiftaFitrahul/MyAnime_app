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
          Consumer<BookMarkProvider>(
              builder: (context, value, child) {
            return Expanded(
                child: (value.animeBookmark.isEmpty)
                    ? const Text("Empty data",
                        style: TextStyle(color: Colors.white))
                    : ListView.builder(
                        itemCount: value.animeBookmark.length,
                        itemBuilder: (context, index) {
                          return Text('data ada');
                        }));
          })
        ],
      ),
    );
  }
}

/*


*/