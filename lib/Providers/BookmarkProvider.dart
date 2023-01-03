import 'package:flutter/cupertino.dart';
import 'package:myanimeapp/Providers/Models/anime.dart';
import 'package:myanimeapp/Providers/Models/animeBookmark.dart';

class BookMarkProvider with ChangeNotifier {
  List<int> idxBookMark = [];

  void addIdxBookmark(idxAnime) {
    idxBookMark.add(idxAnime);
    notifyListeners();
  }

  void removeIdxBookmark(idxAnime) {
    idxBookMark.remove(idxAnime);
    notifyListeners();
  }

  void removeAtIdxBookmark(int idx) {
    idxBookMark.removeAt(idx);
    notifyListeners();
  }
}
