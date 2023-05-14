enum AnimeCollection { home, bookmark, search }

class CollectionAnimeType {
  final AnimeCollection type;
  final int id;

  const CollectionAnimeType({required this.type, required this.id});
}
