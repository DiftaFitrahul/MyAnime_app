import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Models/anime.dart';

class FetchAnimeById {
  static Future<Anime> fetchAnimeById(int id) async {
    try {
      final response =
          await http.get(Uri.parse('https://api.jikan.moe/v4/anime/$id'));
      if (response.statusCode == 200) {
        final anime = jsonDecode(response.body)['data'];
        return Anime.fromJson(anime);
      } else {
        throw Exception();
      }
    } catch (e) {
      rethrow;
    }
  }
}
