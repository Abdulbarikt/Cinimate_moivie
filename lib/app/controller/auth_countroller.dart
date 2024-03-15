import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../views/home/HomePages/main_page.dart';

class AuthController extends GetxController {
  RxString name = ''.obs;
  RxString email = ''.obs;

  Future<void> getUserData() async {
    try {
      User? currentUser = FirebaseAuth.instance.currentUser;

      QuerySnapshot<Map<String, dynamic>> userData = await FirebaseFirestore
          .instance
          .collection("Users")
          .where('uid', isEqualTo: currentUser!.uid)
          .get();

      if (userData.docs.isNotEmpty) {
       
        name.value = userData.docs.last
            .get('name'); 
        email.value = userData.docs.last.get('email');
       
      }
    } catch (error) {
      print('Error retrieving user data: $error');
    }
  }

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
        'image': null,
        'uid': currentUser.uid,
      });

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
