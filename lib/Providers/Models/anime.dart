import 'package:flutter/widgets.dart';

class Anime with ChangeNotifier {
  final String animeId;
  final String animeTitle;
  final String animeImg;
  final String releaseDate;
  final String animeURL;
  bool isFavorite;

  Anime(
      {this.animeId,
      this.animeTitle,
      this.animeImg,
      this.releaseDate,
      this.animeURL,
      this.isFavorite = false});

  factory Anime.fromJson(Map<String, dynamic> json) {
    return Anime(
        animeId: json['animeId'],
        animeTitle: json['animeTitle'],
        animeImg: json['animeImg'],
        releaseDate: json['releaseDate'],
        animeURL: json['aniemUrl']);
  }
}
