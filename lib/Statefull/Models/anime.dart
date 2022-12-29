class Anime {
  final String animeId;
  final String animeTitle;
  final String animeImg;
  final String releaseDate;
  final String animeURL;

  const Anime(
      {this.animeId,
      this.animeTitle,
      this.animeImg,
      this.releaseDate,
      this.animeURL});

  factory Anime.fromJson(Map<String, dynamic> json) {
    return Anime(
        animeId: json['animeId'],
        animeTitle: json['animeTitle'],
        animeImg: json['animeImg'],
        releaseDate: json['releaseDate'],
        animeURL: json['aniemUrl']);
  }
}
