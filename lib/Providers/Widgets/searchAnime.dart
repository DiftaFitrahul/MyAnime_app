import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../AnimesProvider.dart';

class SearchAnimeItem extends StatelessWidget {
  const SearchAnimeItem({super.key});

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
                  SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.77,
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
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Stack(children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 49, 73, 92),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          minimumSize: Size.zero,
                          padding: const EdgeInsets.all(10)),
                      onPressed: (() {}),
                      child: const Icon(Icons.notifications),
                    ),
                    Positioned(
                      right: 16,
                      top: 16,
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
                  TextButton(onPressed: () {}, child: const Text('See More'))
                ],
              ),
            ),
            SizedBox(
              height: 380,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 10, bottom: 25),
                child: Consumer<AnimesProvider>(
                  builder: (context, value, child) => ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: value.popularNow.length,
                      itemBuilder: ((context, index) {
                        return Container(
                          margin: const EdgeInsets.only(right: 20),
                          height: 350,
                          width: 230,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 280,
                                width: 220,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(
                                          value.popularNow[index].animeImg)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 12),
                                child: Text(
                                  value.popularNow[index].animeTitle,
                                  style: TextStyle(
                                      fontSize: 20,
                                      overflow: TextOverflow.ellipsis,
                                      color: Colors.white.withOpacity(0.9)),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 8),
                                child: Text(
                                  'Action, History, Drama, Fantasy, Adventure',
                                  style: TextStyle(
                                      fontSize: 14,
                                      overflow: TextOverflow.ellipsis,
                                      color:
                                          Color.fromARGB(255, 116, 116, 116)),
                                ),
                              )
                            ],
                          ),
                        );
                      })),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
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
                    padding: EdgeInsets.zero,
                    itemCount: value.winter2022.length,
                    itemBuilder: ((context, index) {
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
                                        value.winter2022[index].animeImg)),
                              ),
                            ),
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      value.winter2022[index].animeTitle,
                                      style: TextStyle(
                                          color: Colors.white.withOpacity(0.9),
                                          fontWeight: FontWeight.w500,
                                          overflow: TextOverflow.visible,
                                          fontSize: 19),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(top: 5, bottom: 5),
                                      child: Text(
                                        'Action, Romance, Slice of Life',
                                        style: TextStyle(
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
            )
          ],
        ),
      ),
    );
  }
}
