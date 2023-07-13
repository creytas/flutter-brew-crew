//import 'dart:html';

import 'package:brew_app/models/brew.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});

  /// collection reference
  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection('brews');

  Future updateUserData(
      {required String sugars,
      required String name,
      required int strength}) async {
    await brewCollection
        .doc(uid)
        .set({'sugars': sugars, 'name': name, 'strength': strength});
  }

  /// brew list from snapshot
  List<BrewModel> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return BrewModel(
          name: doc.get("name") ?? "",
          sugars: doc.get("sugars") ?? "0",
          strength: doc.get("strength") ?? 0);
    }).toList();
  }

  /// get brew
  Stream<List<BrewModel>> get brews {
    return brewCollection.snapshots().map(_brewListFromSnapshot);
  }
}
