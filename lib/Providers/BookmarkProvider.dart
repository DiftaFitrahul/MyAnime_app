import 'package:flutter/cupertino.dart';
import 'package:myanimeapp/Providers/Models/anime.dart';
import 'package:myanimeapp/Providers/Models/animeBookmark.dart';

class BookMark with ChangeNotifier {
  Map<String, AnimeBookmark> _bookmarks = {};

  Map<String, AnimeBookmark> get bookMark => _bookmarks;

  void addBookmark(String animeID, String animeTitle, String animeImageUrl,
      String animeReleaseDate) {
    if (_bookmarks.containsKey(animeID)) {
      _bookmarks.update(
          animeID,
          (value) => AnimeBookmark(
              title: value.title,
              imageUrl: value.imageUrl,
              releaseDate: value.releaseDate));
    } else {
      _bookmarks.putIfAbsent(
          animeID,
          () => AnimeBookmark(
              title: animeTitle,
              imageUrl: animeImageUrl,
              releaseDate: animeReleaseDate));
    }
  }
}
