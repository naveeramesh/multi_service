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

  Stream<List<MainService>> getelectrical(String collection) {
    return firebaseFirestore.collection(collection).snapshots().map(
        (snapShot) => snapShot.docs
            .map((document) => MainService(image: document.data()['image'],video: document.data()['video'],
            title: document.data()['title'],category: document.data()['category'],
            price: document.data()['price'],
            description: document.data()['description'],rating: document.data()['rating']))
            .toList());
  }
}
