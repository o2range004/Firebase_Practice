import 'package:do_practice_web/routes/route_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  static AuthController instance = Get.find();
  late Rx<User?> firebaseUser;

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, setInitialScreen);
  }

  setInitialScreen(User? user) {
    if (user == null) {
      // if the user is not found then the user is navigated to the Register Screen
      //Get.offAll(() => LoginPage());
      Get.toNamed(RouteList.LOGINPAGE);
    } else {
      
      // if the user exists and logged in the the user is navigated to the Home Screen
      Get.toNamed(RouteList.FORMPAGE);
    }
  }
  Future login() async {
    try {
      await auth.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);
    } catch (firebaseAuthException) {}
  }

  void signOut() async {
    await auth.signOut();
  }
  String get userEmail{
    return firebaseUser.value!.email ?? "";
  }

}
