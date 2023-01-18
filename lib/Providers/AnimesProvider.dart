import 'dart:convert';
import "dart:math";

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './Service/fetchDataAnime.dart';
import './Models/anime.dart';
import 'package:http/http.dart' as http;

class AnimesProvider with ChangeNotifier {
  Random random = Random();
  List<Anime> _dataAnimes = [];
  List<Anime> get dataAnimes => _dataAnimes;
  bool isLoading = false;
  List<Anime> animeSelection = [];

  Future<void> getAllAnimes() async {
    isLoading = true;
    _dataAnimes = await FetchDataAnime.fetchAnime();
    isLoading = false;
    animeSelection.addAll([
      _dataAnimes[1],
      _dataAnimes[3],
      _dataAnimes[5],
      _dataAnimes[7],
      _dataAnimes[2],
      _dataAnimes[4]
    ]);

    notifyListeners();
  }

  void bmStatus(index) {
    dataAnimes[index].isBookmark = !dataAnimes[index].isBookmark;
    notifyListeners();
  }

  void favoriteStatus(index) {
    dataAnimes[index].isFavorite = !dataAnimes[index].isFavorite;
    notifyListeners();
    //function of notifyListener() is same as setState (to rebuild the widget) but it only rebuilt on the notifyListener's place
  }

  void favoriteStatusinDetailScreen(id) {
    dataAnimes.firstWhere((element) => element.animeId == id).isFavorite =
        !dataAnimes.firstWhere((element) => element.animeId == id).isFavorite;
    notifyListeners();
  }
}
