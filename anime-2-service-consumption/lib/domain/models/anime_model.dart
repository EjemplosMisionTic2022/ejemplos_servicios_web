class AnimeModel {
  String title, posterUrl, showType; 
  String? startDate;
  int members, rank;

  AnimeModel(
      {required this.title,
      required this.rank,
      required this.posterUrl,
      required this.members,
      required this.startDate,
      required this.showType
      });

  factory AnimeModel.fromJson(Map<String, dynamic> map) {
    return AnimeModel(
        title: map['title'],
        rank: map['rank'],
        posterUrl: map['image_url'],
        startDate: map['start_date'],
        showType: map['type'],
        members: map['members']);
  }
}
