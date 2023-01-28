
import 'package:flutter/material.dart';

class Badges extends StatelessWidget {
  const Badges({Key? key, required this.child, required this.value}) : super(key: key);
  final Widget child;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        Positioned(
          right: 8,
          top: 10,
          child: Container(
            padding: const EdgeInsets.all(2.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Theme.of(context).colorScheme.secondary),
            constraints: const BoxConstraints(minHeight: 16, minWidth: 16),
            child: Text(
              value,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 10, color: Colors.black),
            ),
          ),
        )
      ],
    );
  }
}
