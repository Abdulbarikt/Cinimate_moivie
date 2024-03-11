import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_api/app/utils/images.dart';
import 'package:movie_api/app/views/home/auth/forgetpass_page/forget.dart';
import 'package:movie_api/app/views/home/auth/signup_page/signup.dart';
import 'package:movie_api/app/views/home/HomePages/main_page.dart';

import '../../../../utils/colors.dart';
import '../../../widgets/SignUpButton.dart';
import '../../../widgets/Log_Divider.dart';
import '../../../widgets/p_button.dart';
import '../../../widgets/forgot_button.dart';
import '../../../widgets/p_field.dart';
import '../../../widgets/google_button.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/login.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Hi, Welcome Back! 👋',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: AppColors.kWhite,
                  ),
                ),
                const SizedBox(height: 8),
                const SizedBox(height: 26),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PField(
                      controller: email,
                      width: 327,
                      height: 52,
                      hintText: "Email",
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    PField(
                      controller: password,
                      width: 327,
                      height: 52,
                      hintText: "Password",
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ForgotButton(
                      onPressed: () {
                        Get.to(() => const ForgetPass());
                      },
                      title: 'Forgot Password?',
                      textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.kBlackColor),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Column(
                  children: [
                    PButton(
                      onTap: () async {
                        Get.to(() =>  MainPage());
                      },
                      text: 'LogIn',
                      color: AppColors.kPrimary,
                      borderRadius: 20,
                      height: 46,
                      width: 327,
                      fontSize: 14,
                    ),
                    const SizedBox(height: 14),
                    Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: SignUpButton(
                        title: 'Don’t have an account?',
                        subtitle: ' Create here',
                        onTab: () {
                          Get.to(() => const SignUp());
                        },
                        subtitleTextStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.kPrimary,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 45),
                  child: Column(
                    children: [
                      const Log_Divider(title: 'Or Sign In with'),
                      const SizedBox(height: 34),
                      GoogleButton(
                        height: 56,
                        textColor: AppColors.kWhite,
                        width: 280,
                        onTap: () async {
                          // await FirebaseServices().signInWithGoolge();
                        },
                        borderRadius: 24,
                        bgColor: AppColors.kBackground.withOpacity(0.3),
                        text: 'Continue with Google',
                        icons: AppAssets.kGoogleLogo,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
