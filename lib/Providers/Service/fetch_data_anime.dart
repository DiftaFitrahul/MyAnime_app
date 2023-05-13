import 'dart:convert';

import 'package:http/http.dart' as http;
import '../Models/anime.dart';

class FetchDataAnime {
  static Future<List<Anime>> fetchAnime(int currentPage) async {
    final response =
        await http.get(Uri.parse('https://api.jikan.moe/v4/top/anime?page=$currentPage'));
    if (response.statusCode == 200) {
      final animes = (jsonDecode(response.body)['data']) as List;
      return animes.map((e) => Anime.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load Animes');
    }
  }
}
