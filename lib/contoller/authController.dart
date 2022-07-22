import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heem/starting_page.dart';

import '../Pages/wrapper.dart';
import '../components/firebase.dart';
import '../models/user.dart';



class UserController extends GetxController {
  static UserController instance = Get.find();
  late Rx<User?> firebaseUser;
  RxBool isLoggedIn = false.obs;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  String usersCollection = "users";
  //Rx<UserModel> userModel = UserModel(cart: []).obs;


 // @override
/*
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User>(auth.currentUser!);
    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }
*/

/*  _setInitialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => StartingPageState());
    } else {
      userModel.bindStream(listenToUser());
      Get.offAll(() => const SignInScreen());
    }
  }*/

  Future<void> signIn() async {
    try {
      //showLoading();
      await auth.signInWithEmailAndPassword(
              email: email.text.trim(), password: password.text.trim())
          .then((result) {
        Get.showSnackbar(
          const GetSnackBar(
            backgroundColor: Colors.green,
            duration: Duration(seconds: 2),
            message: "You have been signed in!",
            title: 'Done!',
            snackStyle: SnackStyle.FLOATING,
          ),
        );

        Get.offAll(
              () => const StartingPage(),
        );
        _clearControllers();
      });
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar("Sign In Failed", "Try again");
    }
  }

  Future<void> signUp() async {
    //showLoading();
    try {
      await auth
          .createUserWithEmailAndPassword(
              email: email.text.trim(), password: password.text.trim())
          .then((result) {
        String? _userId = result.user?.uid;
        Get.showSnackbar(
          const GetSnackBar(
            backgroundColor: Colors.green,
            duration: Duration(seconds: 2),
            message: "Your account have been generated!",
            title: 'Done!',
            snackStyle: SnackStyle.FLOATING,
          ),
        );
        _addUserToFirestore(_userId ?? '');
        _clearControllers();
        Get.offAll(
              () => const StartingPage(),
        );
      });
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar("Sign In Failed", "Try again");
    }

  }
  Future<bool> isUserLoggedIn() async {
    final User? user = auth.currentUser;

    if (user == null) {
      return false;
    } else {
      return true;
    }
  }


  _addUserToFirestore(String userId) {
    firebaseFirestore.collection(usersCollection).doc(userId).set({
      "name": name.text.trim(),
      "id": userId,
      "email": email.text.trim(),
      "cart": []
    });
  }



  _clearControllers() {
    name.clear();
    email.clear();
    password.clear();
  }

  updateUserData(Map<String, dynamic> data) {
  //  logger.i("UPDATED");
    firebaseFirestore
        .collection(usersCollection)
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .update(data);
  }

  getUserData(Map<String, dynamic> data) {
    //  logger.i("UPDATED");
    firebaseFirestore
        .collection(usersCollection)
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .get();
  }

  Stream<UserModel> listenToUser() => firebaseFirestore
      .collection(usersCollection)
      .doc(FirebaseAuth.instance.currentUser?.uid)
  //(firebaseUser?.value.uid)
      .snapshots()
      .map((snapshot) => UserModel.fromSnapshot(snapshot));

  Future<void> signOut() async {
    await auth.signOut();
    Get.offAll(
          () => const Wrapper(),
    );
  }

}
