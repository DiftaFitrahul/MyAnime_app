import 'package:flutter/cupertino.dart';

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
