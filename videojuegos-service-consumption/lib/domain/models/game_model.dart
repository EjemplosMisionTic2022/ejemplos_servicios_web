class GameModel {
  String title, thumbnail, shortDescription, genre, platform, publisher;
  DateTime releaseDate;

  GameModel(
      {required this.title,
      required this.thumbnail,
      required this.platform,
      required this.shortDescription,
      required this.genre,
      required this.publisher,
      required this.releaseDate});

  factory GameModel.fromJson(Map<String, dynamic> map) {
    return GameModel(
        title: map['title'],
        thumbnail: map['thumbnail'],
        platform: map['platform'],
        shortDescription: map['short_description'],
        genre: map['genre'],
        publisher: map['publisher'],
        releaseDate: DateTime.parse(map['release_date']));
  }
}
