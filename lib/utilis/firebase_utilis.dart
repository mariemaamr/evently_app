import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/event.dart';

class FirebaseUtils {
  static void AddEventToFireStore() {
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

  }


