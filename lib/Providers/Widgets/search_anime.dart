import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Models/anime.dart';
import '../animes_provider.dart';

class SearchAnimeItem extends StatefulWidget {
  const SearchAnimeItem({super.key});

  @override
  State<SearchAnimeItem> createState() => _SearchAnimeItemState();
}

class _SearchAnimeItemState extends State<SearchAnimeItem> {
  String data = '';
  List<Anime> searchAnimeList = [];
  void updateList(String search) {
    searchAnimeList = Provider.of<AnimesProvider>(context, listen: false)
        .dataAnimes
        .where((anime) =>
            anime.animeTitle.toLowerCase().contains(search.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 2, 23, 56),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 40, bottom: 20, left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    child: TextField(
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(top: 12),
                          hintText: 'Search',
                          hintStyle:
                              TextStyle(color: Colors.grey.withOpacity(0.7)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                          filled: true,
                          fillColor: const Color.fromARGB(255, 43, 66, 85),
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Colors.white,
                          )),
                      onSubmitted: (value) {},
                      onChanged: (value) {
                        setState(() {
                          data = value;
                          updateList(value);
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Stack(children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 49, 73, 92),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          minimumSize: Size.zero,
                          padding: const EdgeInsets.all(10)),
                      onPressed: (() {}),
                      child: const Icon(Icons.notifications),
                    ),
                    Positioned(
                      right: 15,
                      top: 15,
                      child: Container(
                        padding: const EdgeInsets.all(2.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.red),
                        constraints:
                            const BoxConstraints(minHeight: 5, minWidth: 5),
                      ),
                    )
                  ])
                ],
              ),
            ),
            data.isEmpty
                ? Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Popular Now",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 23),
                            ),
                            TextButton(
                                onPressed: () {}, child: const Text('See More'))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 380,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 10, bottom: 25),
                          child: Consumer<AnimesProvider>(
                            builder: (context, value, child) =>
                                ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: value.popularNow.length,
                                    itemBuilder: ((context, index) {
                                      final genre =
                                          value.popularNow[index].genre
                                              .map(
                                                (e) => e['name'],
                                              )
                                              .toList()
                                              .join(', ');
                                      return Container(
                                        margin:
                                            const EdgeInsets.only(right: 20),
                                        height: 350,
                                        width: 220,
                                        child: IntrinsicHeight(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Expanded(
                                                //flex: 10,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  child: Image(
                                                      fit: BoxFit.cover,
                                                      image: NetworkImage(value
                                                          .popularNow[index]
                                                          .animeImg)),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10),
                                                child: Text(
                                                  value.popularNow[index]
                                                      .animeTitle,
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      color: Colors.white
                                                          .withOpacity(0.9)),
                                                ),
                                              ),
                                              Text(
                                                genre,
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    color: Color.fromARGB(
                                                        255, 116, 116, 116)),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    })),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Winter 2022",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 23),
                            ),
                            TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'See More',
                                ))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Consumer<AnimesProvider>(
                          builder: (context, value, child) => ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.zero,
                              itemCount: value.winter2022.length,
                              itemBuilder: ((context, index) {
                                final genre = value.winter2022[index].genre
                                    .map(
                                      (e) => e['name'],
                                    )
                                    .toList()
                                    .join(', ');
                                return Container(
                                  height: 150,
                                  margin: const EdgeInsets.only(bottom: 17),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        height: 150,
                                        width: 110,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(13),
                                          child: Image(
                                              fit: BoxFit.fill,
                                              image: NetworkImage(value
                                                  .winter2022[index].animeImg)),
                                        ),
                                      ),
                                      Flexible(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                value.winter2022[index]
                                                    .animeTitle,
                                                style: TextStyle(
                                                    color: Colors.white
                                                        .withOpacity(0.9),
                                                    fontWeight: FontWeight.w500,
                                                    overflow:
                                                        TextOverflow.visible,
                                                    fontSize: 19),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 5, bottom: 5),
                                                child: Text(
                                                  genre,
                                                  style: const TextStyle(
                                                      fontSize: 15,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      color: Color.fromARGB(
                                                          255, 116, 116, 116)),
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons.star_rate,
                                                    color: Colors.yellow,
                                                    size: 17,
                                                  ),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    '8.33',
                                                    style: TextStyle(
                                                        color:
                                                            Colors.grey[400]),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              })),
                        ),
                      )
                    ],
                  )
                : Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        itemCount: searchAnimeList.length,
                        itemBuilder: ((context, index) {
                          final genre = searchAnimeList[index]
                              .genre
                              .map(
                                (e) => e['name'],
                              )
                              .toList()
                              .join(', ');
                          return Container(
                            height: 150,
                            margin: const EdgeInsets.only(bottom: 17),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: 150,
                                  width: 110,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(13),
                                    child: Image(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(
                                            searchAnimeList[index].animeImg)),
                                  ),
                                ),
                                Flexible(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          searchAnimeList[index].animeTitle,
                                          style: TextStyle(
                                              color:
                                                  Colors.white.withOpacity(0.9),
                                              fontWeight: FontWeight.w500,
                                              overflow: TextOverflow.visible,
                                              fontSize: 19),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 5, bottom: 5),
                                          child: Text(
                                            genre,
                                            style: const TextStyle(
                                                fontSize: 15,
                                                overflow: TextOverflow.ellipsis,
                                                color: Color.fromARGB(
                                                    255, 116, 116, 116)),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.star_rate,
                                              color: Colors.yellow,
                                              size: 17,
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              '8.33',
                                              style: TextStyle(
                                                  color: Colors.grey[400]),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        })),
                  ),
          ],
        ),
      ),
    );
  }
}
