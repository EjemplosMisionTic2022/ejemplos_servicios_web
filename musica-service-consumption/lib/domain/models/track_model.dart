class TrackModel {
  String name, artistName, albumName;
  int playbackSeconds;

  TrackModel(
      {required this.name,
      required this.artistName,
      required this.albumName,
      required this.playbackSeconds});

  factory TrackModel.fromJson(Map<String, dynamic> map) {
    return TrackModel(
      name: map['name'],
      artistName: map['artistName'],
      albumName: map['albumName'],
      playbackSeconds: map['playbackSeconds']
    );
  }
}