import 'dart:convert';

import 'package:http/http.dart' as http;
import '../Models/anime.dart';

class FetchDataAnime {
  static Future<List<Anime>> fetchAnime() async {
    try {
      final response =
          await http.get(Uri.parse('https://gogoanime.consumet.org/popular'));
      if (response.statusCode == 200) {
        final animes = (jsonDecode(response.body)) as List;
        return animes.map((e) => Anime.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load Animes');
      }
    } catch (e) {
      rethrow;
    }
  }
}
