class ArticleModel {
  String title, thumbnail, abstract, subsection, itemType, byline;
  DateTime publishedDate;

  ArticleModel(
      {required this.title,
      required this.thumbnail,
      required this.itemType,
      required this.abstract,
      required this.subsection,
      required this.byline,
      required this.publishedDate});

  factory ArticleModel.fromJson(Map<String, dynamic> map) {
    return ArticleModel(
        title: map['title'],
        thumbnail: map['multimedia'][0]['url'],
        itemType: map['subsection'],
        abstract: map['abstract'],
        subsection: map['subsection'],
        byline: map['byline'],
        publishedDate: DateTime.parse(map['published_date']));
  }
}