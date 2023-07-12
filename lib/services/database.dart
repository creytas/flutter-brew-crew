//import 'dart:html';

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

  /// get brew
  Stream<QuerySnapshot> get brews {
    return brewCollection.snapshots();
  }
}
