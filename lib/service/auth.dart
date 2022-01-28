import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future signinAnonymus() async {
    try {
      UserCredential usercredential = await auth.signInAnonymously();
      User? user = usercredential.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
