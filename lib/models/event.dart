class Event {

  static const String collectionName = 'Events';


  String? id;
  String title;
  String description;
  String image;
  String eventName;
  DateTime dateTime;
  String time;
  bool isFavorite;


  Event({
    this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.eventName,
    required this.dateTime,
    required this.time,
    this.isFavorite=false,
  });

 //convert json to event object
  factory Event.fromFirestore(Map<String, dynamic> json, {String? id}) {
    return Event(
      id: json['id']as String?,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      image: json['image'] ?? '',
      eventName: json['eventName'] ?? '',
      dateTime: DateTime.fromMillisecondsSinceEpoch(json['dateTime']),
      time: json['time'] ?? '',
      isFavorite: json['isFavorite'],
    );
  }

  //  convert an event object to  json
  Map<String, dynamic> toFirestore() {
    return {
      'title': title,
      'description': description,
      'image': image,
      'eventName': eventName,
      'dateTime': dateTime.millisecondsSinceEpoch,
      'time': time,
      'isFavorite': isFavorite,
    };
  }
}
