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
                    height: 40,
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: TextField(
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(top: 10),
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
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text('makan'),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
