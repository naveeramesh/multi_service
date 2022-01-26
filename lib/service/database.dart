import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:home_service/models/service.dart';

class FbDatabase {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Stream<List<Service>> get data {
    return firebaseFirestore.collection("Service").snapshots().map((event) =>
        event.docs
            .map((e) =>
                Service(title: e.data()['title'], image: e.data()['image']))
            .toList());
  }
}
