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
      {this.animeId,
      this.animeTitle,
      this.animeImg,
      this.releaseDate,
      this.animeURL,
      this.isFavorite = false,
      this.isBookmark = false});

  factory Anime.fromJson(Map<String, dynamic> json) {
    return Anime(
        animeId: json['animeId'],
        animeTitle: json['animeTitle'],
        animeImg: json['animeImg'],
        releaseDate: json['releaseDate'],
        animeURL: json['aniemUrl']);
  }

  void favoriteStatus() {
    isFavorite = !isFavorite;
    notifyListeners();
    //function of notifyListener() is same as setState (to rebuild the widget) but it only rebuilt on the notifyListener's place
  }

  void bookmarkStatus() {
    isBookmark = !isBookmark;
    notifyListeners();
  }
}
