class EventModel {
  String title, type, description, organizer, venue, screenshot;
  DateTime startDate;


  EventModel(
      {required this.title,
      required this.description,
      required this.screenshot,
      required this.type,
      required this.organizer,
      required this.venue,
      required this.startDate});

  factory EventModel.fromJson(Map<String, dynamic> map) {
    return EventModel(
        title: map['title'],
        description: map['description'],
        organizer: map['organizer'],
        screenshot: map['screenshot'],
        startDate: DateTime.parse(map['end_date']),
        venue: map['venue'],
        type: map['type']);
  }
}