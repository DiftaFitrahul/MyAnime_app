import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 2, 23, 56),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.70,
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
          ],
        ),
      ),
    );
  }
}
