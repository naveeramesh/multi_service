import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:home_service/models/mainservice.dart';
import 'package:home_service/models/offer.dart';
import 'package:home_service/models/service.dart';

class FbDatabase {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Stream<List<Offer>> getoffer(String collection) {
    return firebaseFirestore.collection(collection).snapshots().map((event) =>
        event.docs.map((e) => Offer(image: e.data()['image'])).toList());
  }

  Stream<List<Service>> getdata(String collection) {
    return firebaseFirestore.collection(collection).snapshots().map((event) =>
        event
            .docs
            .map((e) =>
                Service(title: e.data()['category'], image: e.data()['image']))
            .toList());
  }

  Stream<List<MainService>> getelectrical(String collection, String name) {
    return firebaseFirestore
        .collection(collection)
        .where("category", isEqualTo: name)
        .snapshots()
        .map((snapShot) => snapShot.docs
            .map((document) => MainService.fromJson(document.data()))
            .toList());
  }
  //  Stream<List<Cleaning>> getcleaning(String collection, String name) {
  //   return firebaseFirestore
  //       .collection(collection)
  //       .where("category", isEqualTo: name)
  //       .snapshots()
  //       .map((event) => event.docs
  //           .map((e) =>
  //               Cleaning(title: e.data()['title'], image: e.data()['image']))
  //           .toList());
  // }
}
