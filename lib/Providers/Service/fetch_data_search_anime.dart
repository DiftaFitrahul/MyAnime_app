import 'dart:convert';

import 'package:http/http.dart' as http;
import '../Models/anime.dart';

class FetchDataSearchAnime {
  static Future<List<Anime>> fetchAnimeSearch(String animeSearch) async {
    try {
      final response = await http.get(Uri.parse(
          'https://api.jikan.moe/v4/anime?letter=$animeSearch&limit=30'));
      if (response.statusCode == 200) {
        final List animesSearch = jsonDecode(response.body)['data'];
        return animesSearch
            .map((animeSearch) => Anime.fromJson(animeSearch))
            .toList();
      } else {
        throw Exception('ERROR');
      }
    } catch (e) {
      rethrow;
    }
  }
}
