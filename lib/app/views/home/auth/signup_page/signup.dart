import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_api/app/utils/images.dart';
import 'package:movie_api/app/views/home/auth/login_page/login.dart';
import 'package:movie_api/app/views/widgets/Log_Divider.dart';
import 'package:movie_api/app/views/widgets/SignUpButton.dart';
import 'package:movie_api/app/views/widgets/google_button.dart';
import 'package:movie_api/app/views/widgets/p_field.dart';

import '../../../../controller/auth_countroller.dart';
import '../../../../utils/colors.dart';
import '../../../widgets/p_button.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController username = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    return Scaffold(
      backgroundColor: AppColors.kBlackColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SizedBox(
            width: 327,
            child: Column(children: [
              Text(
                'Create Account',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ).copyWith(
                    color: AppColors.kWhite,
                    fontWeight: FontWeight.w600,
                    fontSize: 24),
              ),
              const SizedBox(height: 8),
              Text(
                'We happy to see you. Sign Up to your account',
                textAlign: TextAlign.center,
                style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.kWhite)
                    .copyWith(
                        color: AppColors.kGrayscale40,
                        fontWeight: FontWeight.w600,
                        fontSize: 14),
              ),
              const SizedBox(
                height: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Username',
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
                  PField(controller: username, width: 327, height: 52)
                ],
              ),
              const SizedBox(
                height: 15,
              ),
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
                  const SizedBox(height: 7),
                  PField(controller: email, width: 327, height: 52)
                ],
              ),
              const SizedBox(height: 15),
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
              const SizedBox(height: 28),
              Column(
                children: [
                  PButton(
                    // elevation: 0,
                    onTap: () async {
                      AuthController().registerUser(
                          username.text, email.text, password.text);
                    },
                    text: 'Create Account',

                    borderRadius: 20,
                    height: 46,
                    width: 327,
                  ),
                  const SizedBox(height: 20),
                  SignUpButton(
                    title: 'Already have an account? ',
                    subtitle: 'Log In',
                    onTab: () {
                      Get.to(() => LoginScreen());
                    },
                    subtitleTextStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.kWhite)
                        .copyWith(
                            color: AppColors.kWhite,
                            fontWeight: FontWeight.w600,
                            fontSize: 14),
                  )
                ],
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Log_Divider(title: 'Or Sign Up with'),
                    ),
                    const SizedBox(height: 24),
                    GoogleButton(
                        height: 56,
                        textColor: AppColors.kWhite,
                        width: 260,
                        onTap: () {},
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
