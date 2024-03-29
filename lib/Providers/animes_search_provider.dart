import 'package:flutter/material.dart';

import './Models/anime.dart';
import './Service/fetch_data_search_anime.dart';

class AnimesSearchProvider extends ChangeNotifier {
  List<Anime> _animesSearchResult = [];
  bool isLoadingSearch = false;

  List<Anime> get animesSearch => _animesSearchResult;

  void updateSearchAnimeList(String search) async {
    isLoadingSearch = true;
    notifyListeners();
    _animesSearchResult = await FetchDataSearchAnime.fetchAnimeSearch(search);
    isLoadingSearch = false;
    notifyListeners();
  }
}
