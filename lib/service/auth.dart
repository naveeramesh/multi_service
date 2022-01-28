import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:home_service/models/users.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Users? users(User? user) {
    if (user != null) {
      addData(user);
      return Users(
          uid: user.uid,
          image: user.photoURL,
          name: user.displayName,
          email: user.email);
    } else {
      return null;
    }
  }

  Stream<Users?> get user {
    return auth.authStateChanges().map((User? user) => users(user!));
  }

  Future signinAnonymus() async {
    try {
      UserCredential usercredential = await auth.signInAnonymously();
      User? user = usercredential.user;
      return users(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      UserCredential result = await auth.signInWithCredential(credential);

      User? user = result.user;
      return users(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signout() async {
    try {
      await auth.signOut();
    } catch (e) {
      return null;
    }
  }

  void addData(User user) {
    firebaseFirestore.collection("Users").doc(user.uid).set({
      "name": user.displayName,
      "email": user.email,
      "image": user.photoURL,
      'uid': user.uid
    });
  }
}