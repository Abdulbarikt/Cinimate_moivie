import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../views/home/HomePages/main_page.dart';

class AuthController extends GetxController {
  Future<void> registerUser(
      String email, String password, String username) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? currentUser = FirebaseAuth.instance.currentUser;
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(currentUser!.uid)
          .set({
        'name': username,
        'email': email,
        'uid': currentUser.uid,
      });
      Get.to(() => const MainPage());
      print('User created: ${userCredential.user!.email}');
    } catch (e) {
      print('Error creating user: $e');
    }
  }

  Future<void> signInUser(String email, String password) async {
    try {
      final userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      Get.to(() => const MainPage());
      print('User signed in: ${userCredential.user!.email}');
    } catch (e) {
      // Print and handle errors
      print('Error signing in: $e');
    }
  }
}
