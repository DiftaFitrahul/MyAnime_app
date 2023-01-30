import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search Page'),),
      body: Center(
        child: Column(
          children: const [
            Icon(Icons.search),
            Text('Search')
          ],
        ),
      )
      ,
    );
  }
}