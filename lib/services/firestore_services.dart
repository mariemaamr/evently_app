import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/event.dart';

class FireStoreServices {
  void AddEventToFireStore() {
    FirebaseFirestore.instance
        .collection(Event.collectionName)
        .withConverter<Event>(
          fromFirestore: (snapshot, options) =>
              Event.fromFirestore(snapshot.data()!, id: snapshot.id),
          toFirestore: (event, _) => event.toFirestore(),
        );
  }

  static CollectionReference<Event> getEventCollection() {
    return FirebaseFirestore.instance
        .collection(Event.collectionName)
        .withConverter<Event>(
          fromFirestore: (snapshot, options) =>
              Event.fromFirestore(snapshot.data()!, id: snapshot.id),
          toFirestore: (event, _) => event.toFirestore(),
        );
  }

  static Future<bool> createNewEvent(Event eventData) async {
    try {
      final collectionRef = getEventCollection();
      var docRef = collectionRef.doc();
      eventData.id = docRef.id;
      await docRef.set(eventData);
      return true;
    } catch (error) {
      print(error.toString());
      return false;
    }
  }

  Future<List<Event>> getDataFromFirestore() async {
    var collectionRef = getEventCollection();
    QuerySnapshot<Event> data = await collectionRef.get();

    List<Event> eventDataList = data.docs.map(
      (element) {
        return element.data();
      },
    ).toList();

    return eventDataList;
  }
}
