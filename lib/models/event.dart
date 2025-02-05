import 'package:flutter/material.dart';

class Event {
  static const String collectionName = 'Events';

  String? id;
  String title;
  String description;
  String image;
  String category;
  DateTime dateTime;
  TimeOfDay time;
  bool isFavorite;

  Event({
    this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.category,
    required this.dateTime,
    required this.time,
    this.isFavorite = false,
  });

  // Convert JSON to Event object
  factory Event.fromFirestore(Map<String, dynamic> json, {String? id}) {
    return Event(
      id: id ?? json['id'] as String?,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      image: json['image'] ?? '',
      category: json['category'] ?? '',
      dateTime: DateTime.fromMillisecondsSinceEpoch(json['dateTime']),
      // ✅ Convert from milliseconds
      time: json['time'] != null
          ? TimeOfDay(
              hour: int.parse(json['time'].split(":")[0]),
              minute: int.parse(json['time'].split(":")[1]),
            )
          : TimeOfDay.now(),
      isFavorite: json['isFavorite'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'image': image,
      'category': category,
      'dateTime': dateTime.millisecondsSinceEpoch,
      'time': '${time.hour}:${time.minute}',
      'isFavorite': isFavorite,
    };
  }
}

