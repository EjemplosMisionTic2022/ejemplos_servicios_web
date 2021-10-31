class ArtWorkModel {
  String title, placeOrigin, dimensions, department, artistTitle, imageUrl, style;

  ArtWorkModel(
      {required this.title,
      required this.artistTitle,
      required this.department,
      required this.dimensions,
      required this.imageUrl,
      required this.placeOrigin,
      required this.style});

  factory ArtWorkModel.fromJson(Map<String, dynamic> map) {
    return ArtWorkModel(
        title: map['title'],
        artistTitle: map['artist_title'],
        department: map['department_title'],
        style: map['style_title'],
        dimensions: map['dimensions'],
        imageUrl: "https://www.artic.edu/iiif/2/${map['image_id']}/full/200,/0/default.jpg",
        placeOrigin: map['place_of_origin']);
  }
}