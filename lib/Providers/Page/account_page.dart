import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Page'),
      ),
      body: Center(
        child: Column(
          children:  [
            const Icon(Icons.search), 
            const Text('Search'),
            Container(width: 100, height: 100,
            child: Image(image: NetworkImage("")),
            )
            ],
        ),
      ),
    );
  }
}

//lets create a ui of account page