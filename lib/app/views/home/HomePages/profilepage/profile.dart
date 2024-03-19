import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_api/app/controller/auth_countroller.dart';
import 'package:movie_api/app/views/home/HomePages/profilepage/faq.dart';
import 'package:movie_api/app/views/home/HomePages/profilepage/help.dart';
import 'package:movie_api/app/views/home/HomePages/profilepage/support.dart';
import 'package:movie_api/app/views/home/HomePages/profilepage/terms.dart';
import 'package:movie_api/app/views/home/auth/login_page/login.dart';
import '../../../../utils/colors.dart';
import 'listtile.dart';

class Profile extends StatefulWidget {
  const Profile({
    Key? key,
  }) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final AuthController _userData = Get.put(AuthController());

  @override
  void initState() {
    super.initState();
    _userData.getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBlackColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/images/profile.jpg'),
              ),
            ),
            const SizedBox(height: 16.0),
            Center(
              child: Column(
                children: [
                  const SizedBox(height: 8.0),
                  Obx(
                    () => Text(
                      _userData.name.value,
                      style: const TextStyle(
                        color: AppColors.kPrimary,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Obx(
                    () => Text(
                      _userData.email.value,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            const Divider(
              color: AppColors.kPrimary,
              thickness: 2,
              indent: 30,
              endIndent: 30,
            ),
            const SizedBox(height: 35),
            buildListTile(
                icon: Icons.language_outlined,
                title: 'Terms and Conditions',
                onTap: () => Get.to(() => const Terms())),
            buildListTile(
                icon: Icons.policy,
                title: 'FaQ',
                onTap: () => Get.to(() => const Faq())),
            buildListTile(
                icon: Icons.support,
                title: 'Support Us',
                onTap: () => Get.to(() => const SupportPage())),
            buildListTile(
                icon: Icons.help,
                title: 'Help',
                onTap: () => Get.to(() => const HelpPage())),
            buildListTile(
                icon: Icons.logout,
                title: 'Logout',
                onTap: () {
                  FirebaseAuth.instance.signOut();
                  Get.offAll(() => LoginScreen());
                }),
          ],
        ),
      ),
    );
  }
}
