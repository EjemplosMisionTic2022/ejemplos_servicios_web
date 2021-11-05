class ArtWorkModel {
  String title, longTitle, artist, imageUrl;
  List<dynamic> productionPlaces;

  ArtWorkModel(
      {required this.title,
      required this.artist,
      required this.longTitle,
      required this.imageUrl,
      required this.productionPlaces});

  factory ArtWorkModel.fromJson(Map<String, dynamic> map) {
    return ArtWorkModel(
        title: map['title'],
        artist: map['principalOrFirstMaker'],
        longTitle: map['longTitle'],
        productionPlaces: map['productionPlaces'],
        imageUrl: map['webImage']['url']
    );
  }
}