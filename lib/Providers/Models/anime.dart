import 'package:flutter/widgets.dart';

class Anime with ChangeNotifier {
  final String animeId;
  final String animeTitle;
  final String animeImg;
  final String releaseDate;
  final String animeURL;
  bool isFavorite;
  bool isBookmark;

  Anime(
      {required this.animeId,
      required this.animeTitle,
      required this.animeImg,
      required this.releaseDate,
      required this.animeURL,
      this.isFavorite = false,
      this.isBookmark = false});

  factory Anime.fromJson(Map<String, dynamic> json) {
    return Anime(
        animeId: json['mal_id'].toString(),
        animeTitle: json['titles'][0]['title'] ?? '',
        animeImg: json['images']['jpg']['large_image_url'] ?? '',
        releaseDate: json['aired']['string'] ?? '',
        animeURL: json['url'] ?? '');
  }
}
