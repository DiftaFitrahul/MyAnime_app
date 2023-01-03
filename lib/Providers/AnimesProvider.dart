import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './Service/fetchDataAnime.dart';
import './Models/anime.dart';
import 'package:http/http.dart' as http;

class AnimesProvider with ChangeNotifier {
  List<Anime> _dataAnimes = [];
  List<Anime> get dataAnimes => _dataAnimes;
  bool isLoading = false;

  Future<void> getAllAnimes() async {
    isLoading = true;
    _dataAnimes = await FetchDataAnime.fetchAnime();
    isLoading = false;
    notifyListeners();
  }

  void bmStatus(index) {
    dataAnimes[index].isBookmark = !dataAnimes[index].isBookmark;
    notifyListeners();
  }
}
