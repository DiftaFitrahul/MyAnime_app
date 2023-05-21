import 'package:flutter/material.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:provider/provider.dart';

import '../animes_provider.dart';

class NumberPaginatorClass extends StatefulWidget {
  const NumberPaginatorClass({super.key});

  @override
  State<NumberPaginatorClass> createState() => _NumberPaginatorState();
}

class _NumberPaginatorState extends State<NumberPaginatorClass> {
  @override
  Widget build(BuildContext context) {
    
    return NumberPaginator(
      numberPages: 20,
      config: const NumberPaginatorUIConfig(
        buttonSelectedForegroundColor: Color.fromARGB(255, 2, 23, 56),
        buttonUnselectedForegroundColor: Colors.white,
        buttonSelectedBackgroundColor: Colors.amber,
      ),
      onPageChange: (p0) {
        setState(() {});
        Provider.of<AnimesProvider>(context, listen: false)
            .getAllAnimes(p0 + 1);
       
      },
    );
  }
}
