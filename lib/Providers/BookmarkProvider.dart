import 'package:flutter/cupertino.dart';
import 'package:myanimeapp/Providers/Models/anime.dart';
import 'package:myanimeapp/Providers/Models/animeBookmark.dart';

class BookMarkProvider with ChangeNotifier {
  final Map<String, AnimeBookmark> _bookmarks = {};

  Map<String, AnimeBookmark> get bookMark => _bookmarks;

  List<int> idxBookMark = [];

  int get bookmarkLength {
    return _bookmarks.length;
  }

  void addBookmark(String animeID, String animeTitle, String animeImageUrl,
      String animeReleaseDate) {
    _bookmarks.putIfAbsent(
        animeID,
        () => AnimeBookmark(
            title: animeTitle,
            imageUrl: animeImageUrl,
            releaseDate: animeReleaseDate));

    notifyListeners();
  }

  void removeBookmark(String animeID) {
    _bookmarks.remove(animeID);
    notifyListeners();
  }
}
