import "dart:math";
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Service/fetch_data_anime.dart';
import './Models/anime.dart';

class AnimesProvider with ChangeNotifier {
  Random random = Random();

  List<Anime> _dataAnimes = [];
  List<Anime> get dataAnimes => _dataAnimes;
  bool isLoading = false;
  List<Anime> animeSelection = [];
  List<Anime> popularNow = [];
  List<Anime> winter2022 = [];


  Future<void> firstGetAllAnimes() async {
    isLoading = true;
    _dataAnimes = await FetchDataAnime.fetchAnime(1);
    isLoading = false;
    animeSelection.addAll([
      _dataAnimes[1],
      _dataAnimes[3],
      _dataAnimes[5],
      _dataAnimes[7],
      _dataAnimes[2],
      _dataAnimes[4]
    ]);
    popularNow.addAll([
      _dataAnimes[11],
      _dataAnimes[8],
      _dataAnimes[6],
      _dataAnimes[13],
      _dataAnimes[10]
    ]);
    winter2022.addAll([
      _dataAnimes[15],
      _dataAnimes[16],
      _dataAnimes[17],
      _dataAnimes[18],
      _dataAnimes[19]
    ]);
    notifyListeners();
  }

  Future<void> getAllAnimes(int currentIndex) async {
    animeSelection = [];
    popularNow = [];
    winter2022 = [];
    isLoading = true;
    notifyListeners();
    _dataAnimes = await FetchDataAnime.fetchAnime(currentIndex);
    isLoading = false;
    animeSelection.addAll([
      _dataAnimes[1],
      _dataAnimes[3],
      _dataAnimes[5],
      _dataAnimes[7],
      _dataAnimes[2],
      _dataAnimes[4]
    ]);
    popularNow.addAll([
      _dataAnimes[11],
      _dataAnimes[8],
      _dataAnimes[6],
      _dataAnimes[13],
      _dataAnimes[10]
    ]);
    winter2022.addAll([
      _dataAnimes[15],
      _dataAnimes[16],
      _dataAnimes[17],
      _dataAnimes[18],
      _dataAnimes[19]
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
