import 'package:firebase_auth/firebase_auth.dart';
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
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBlackColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SizedBox(
            width: 327,
            child: Column(children: [
              Text(
                'Hi, Welcome Back! 👋',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ).copyWith(color: AppColors.kWhite, fontSize: 20),
              ),
              const SizedBox(height: 8),
              Text(
                'We happy to see you. Sign In to your account',
                textAlign: TextAlign.center,
                style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.kWhite)
                    .copyWith(color: AppColors.kGrayscale40, fontSize: 14),
              ),
              const SizedBox(height: 36),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Email',
                    style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.kWhite)
                        .copyWith(
                            color: AppColors.kWhite,
                            fontWeight: FontWeight.w600,
                            fontSize: 14),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  PField(controller: email, width: 327, height: 52)
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Password',
                    style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.kWhite)
                        .copyWith(
                            color: AppColors.kWhite,
                            fontWeight: FontWeight.w600,
                            fontSize: 14),
                  ),
                  const SizedBox(height: 8),
                  PField(controller: password, width: 327, height: 52)
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ForgotButton(
                    onPressed: () {
                      Get.to(() => const ForgetPass());
                    },
                    title: 'Forgot Password?',
                    textStyle: const TextStyle(color: AppColors.kWhite),
                  )
                ],
              ),
              const SizedBox(height: 32),
              Column(
                children: [
                  PButton(
                    onTap: () async {
                      // AuthController().signInUser(email.text, password.text);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MainPage()));
                    },
                    text: 'LogIn',
                    color: AppColors.kPrimary,
                    borderRadius: 20,
                    height: 46,
                    width: 327,
                    // textColor: AppColors.kWhite,
                    fontSize: 14,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
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
                              color: AppColors.kWhite)
                          .copyWith(
                              color: AppColors.kPrimary,
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 52),
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
                        icons: AppAssets.kGoogleLogo),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
