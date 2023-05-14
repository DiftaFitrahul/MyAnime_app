import 'package:flutter/cupertino.dart';
import 'package:myanimeapp/Providers/Service/fetch_data_anime_by_id.dart';

import './Models/anime.dart';

class BookMarkProvider with ChangeNotifier {
  List<int> animeIdBookmark = [];
  List<Anime> animeBookmark = [];

  void getBookmarkAnime() async {
    final anime = await FetchAnimeById.fetchAnimeById(animeIdBookmark.last);
    animeBookmark.add(anime);
    notifyListeners();
  }

  void addIdxBookmark(idxAnime) {
    animeIdBookmark.add(idxAnime);
    notifyListeners();
  }

  void removeBookmark(Anime animeRemove) {
    animeBookmark.removeWhere(
      (anime) => anime.animeId == animeRemove.animeId,
    );
    animeIdBookmark.removeWhere(
      (id) => id == animeRemove.animeId,
    );
    notifyListeners();
  }

}
