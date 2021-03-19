import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:minathon/users/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserC _userFromFirebaseUser(User user) {
    return user != null ? UserC(uid: user.uid) : null;
  } 

  Future signInAnon() async {
    try {
      await Firebase.initializeApp();
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
