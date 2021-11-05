class GameModel {
  String title, thumbnail, description, status, platform, type, worth;
  dynamic endDate;

  GameModel(
      {required this.title,
      required this.thumbnail,
      required this.platform,
      required this.description,
      required this.status,
      required this.type,
      required this.endDate,
      required this.worth});

  factory GameModel.fromJson(Map<String, dynamic> map) {
    return GameModel(
        title: map['title'],
        thumbnail: map['thumbnail'],
        platform: map['platforms'],
        description: map['description'],
        status: map['status'],
        type: map['type'],
        endDate: map['end_date']!="N/A"?DateTime.parse(map['end_date']):map['end_date'],
        worth: map['worth']);
  }
}
