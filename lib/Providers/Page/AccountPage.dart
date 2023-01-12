import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

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