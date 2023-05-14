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
          Consumer<BookMarkProvider>(builder: (context, value, child) {
            return Expanded(
                child: (value.animeBookmark.isEmpty)
                    ? const Text("Empty data",
                        style: TextStyle(color: Colors.white))
                    : ListView.builder(
                        itemCount: value.animeBookmark.length,
                        itemBuilder: (context, index) {
                          String genre = value.animeBookmark[index].genre
                              .map((e) => e['name'])
                              .toList()
                              .join(', ');
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 20),
                            child: Column(children: [
                              SizedBox(
                                width: double.infinity,
                                height: 170,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 100,
                                      height: 150,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Image.network(
                                          value.animeBookmark[index].animeImg,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    SizedBox(
                                      width: 200,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            value.animeBookmark[index]
                                                .animeTitle,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(genre,
                                              style: const TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12))
                                        ],
                                      ),
                                    ),
                                    Center(
                                      child: Expanded(
                                          child: IconButton(
                                              color: Colors.white,
                                              onPressed: () {
                                                value.removeBookmark(
                                                    value.animeBookmark[index]);
                                              },
                                              icon: const Icon(Icons.delete))),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 350,
                                child: Divider(
                                  color: Colors.amber,
                                ),
                              )
                            ]),
                          );
                        }));
          })
        ],
      ),
    );
  }
}

/*


*/