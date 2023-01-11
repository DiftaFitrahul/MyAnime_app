import 'package:flutter/cupertino.dart';

class AnimeBookmark {
  final String title;
  final String imageUrl;
  final String releaseDate;
  bool isDelete = false;

  AnimeBookmark(
      {required this.title,
      required this.imageUrl,
      required this.releaseDate});
}
