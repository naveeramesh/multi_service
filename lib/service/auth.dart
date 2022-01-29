import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:home_service/models/users.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Users? users(User? user) {
    if (user == null) {
      return null;
    } else {
      addData(user);
      return Users(
          uid: user.uid,
          image: user.photoURL,
          name: user.displayName,
          email: user.email ?? "no email");
    }
  }

  Stream<Users?> get user {
    return auth.authStateChanges().map((User? user) => users(user));
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
      return e;
    }
  }

  Future signout() async {
    try {
      return await auth.signOut();
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
