import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {
  final FirebaseAuth auth;

  UserRepository(this.auth);

  Future<FirebaseUser> login(String email, String password) async {
    return auth.signInWithEmailAndPassword(email: email, password: password);
  }
}
