class Anime {
  final String animeId;
  final String animeTitle;
  final String animeImg;
  final String releaseDate;
  final String animeURL;

  const Anime(
      {required this.animeId,
      required this.animeTitle,
      required this.animeImg,
      required this.releaseDate,
      required this.animeURL});

  factory Anime.fromJson(Map<String, dynamic> json) {
    return Anime(
        animeId: json['animeId'],
        animeTitle: json['animeTitle'],
        animeImg: json['animeImg'],
        releaseDate: json['releaseDate'],
        animeURL: json['aniemUrl']);
  }
}
