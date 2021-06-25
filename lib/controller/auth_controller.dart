import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workvn/model/User/User.dart';
import 'package:workvn/navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workvn/ui/widgets/loading_indicator.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Rxn<User> _firebaseUser = Rxn<User>();
  Rxn<UserModel> _firestoreUser = Rxn<UserModel>();

  Rxn<User> get firebaseUser => _firebaseUser;

  Rxn<UserModel> get firestoreUser => _firestoreUser;

  Stream<User?> get userState =>
      _auth.authStateChanges(); // check sign in sign out

  Future<User?> get currentUser async => _auth.currentUser;

  @override
  void onInit() {
    _firebaseUser.bindStream(userState);
    ever(_firebaseUser,
        handleAuthChanged); // called handleAuthChanged every time _firebaseUser changes
    super.onInit();
  }

  // bool checkIfUserExists(){
  //   var collectionRef = Firestore.instance.collection('/users/${_firebaseUser.value!.uid}');
  //
  //   var doc = await collectionRef.document(docId).get();
  //   return doc.exists;
  // }

  Stream<UserModel> streamFirestoreUser() {
    // return user data from firestore
    print('bind stream');
    return _firestore
        .collection('users')
        .doc('${_firebaseUser.value!.uid}')
        .snapshots()
        .map((snapshot) => UserModel.fromMap(snapshot.data()!));
  }

  // Future<void> isAdmin() async {
  //   await currentUser.then((user) async {
  //     DocumentSnapshot adminRef =
  //         await _db.collection('admin').doc(user!.uid).get();
  //     if (adminRef.exists) {
  //       _isAd.value = true;
  //     } else {
  //       _isAd.value = false;
  //     }
  //     update();
  //   });
  // }

  Future<bool> checkFirstTimeLaunch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('firstTime') ?? true;
  }

  void handleAuthChanged(User? _firebaseUser) async {
    if (_firebaseUser?.uid != null) {
      // logged in
      _firestoreUser.bindStream(
          streamFirestoreUser()); // bind user from firestore to local
      //await isAdmin();
    }

    if (_firebaseUser == null) {
      if (await checkFirstTimeLaunch()) {
        Get.offAllNamed(SiteNavigation.ONBOARDING);
      } else
        Get.offAllNamed(SiteNavigation.LOGIN);
    } else {
      Get.offAllNamed(SiteNavigation.MAIN);
      //Get.offAllNamed(SiteNavigation.HOME);
    }
  }

  void _createUserFirestore(UserModel user, User _firebaseUser) {
    _firestore.doc('/users/${_firebaseUser.uid}').set(user.toJSON());
    update();
  }

  Future<void> signUp(
      String email, String password, String name, BuildContext context) async {
    try {
      showLoadingIndicator(context);
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((result) {
        if (name.isEmpty) {
          Get.snackbar('Lôi đăng kí tài khoản', 'Thiếu username!');
        } else if (name.isNotEmpty) {
          UserModel user = UserModel(
              name: name, uid: result.user!.uid, favorites: ["id_holder"]);
          _createUserFirestore(user, result.user!);
        }
      });
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      Get.snackbar('Lỗi đăng kí tài khoản', e.message.toString());
    }
  }

  Future<void> login(
      String email, String password, BuildContext context) async {
    try {
      showLoadingIndicator(context);
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      Get.snackbar('Lỗi đăng nhập', e.message.toString());
    }
  }

  void signOut() async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Lỗi đăng xuất', e.message.toString());
    }
  }
}
