import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  AuthService._();

  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  FirebaseAuth get firebaseAuth => _firebaseAuth;
}
