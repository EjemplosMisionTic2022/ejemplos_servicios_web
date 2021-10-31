class MovieModel {
  String title, overview , posterUrl, mediaType;
  DateTime releaseDate;

  MovieModel(
    {required this.title,
    required this.mediaType,
    required this.overview,
    required this.posterUrl,
    required this.releaseDate
  });

  factory MovieModel.fromJson(Map<String, dynamic> map) {
    return MovieModel(
        title: map['title'],
        mediaType: map['media_type'],
        overview: map['overview'],
        releaseDate: DateTime.parse(map['release_date']),
        posterUrl: "https://image.tmdb.org/t/p/w154${map['poster_path']}"
    );
  }
}