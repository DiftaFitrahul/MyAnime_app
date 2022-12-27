import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:myanimeapp/Service/anime.dart';

class FetchDataAnime {
  static Future<List<Anime>> fetchAnime() async {
    final response =
        await http.get(Uri.parse('https://gogoanime.consumet.org/popular'));
    if (response.statusCode == 200) {
      final Animes = (jsonDecode(response.body)) as List;
      return Animes.map((e) => Anime.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load Animes');
    }
  }
}
