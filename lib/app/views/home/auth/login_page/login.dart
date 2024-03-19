import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_api/app/utils/images.dart';
import 'package:movie_api/app/views/home/auth/forgetpass_page/forget.dart';
import 'package:movie_api/app/views/home/auth/signup_page/signup.dart';
import 'package:movie_api/app/views/home/HomePages/main_page.dart';

import '../../../../services/google_services.dart';
import '../../../../utils/colors.dart';
import '../../../widgets/SignUpButton.dart';
import '../../../widgets/Log_Divider.dart';
import '../../../widgets/p_button.dart';
import '../../../widgets/forgot_button.dart';
import '../../../widgets/p_field.dart';
import '../../../widgets/google_button.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
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
                  const SizedBox(height: 26),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PField(
                        obsecure: false,
                        prefixIcon: Icon(Icons.email),
                        controller: email,
                        width: 327,
                        height: 52,
                        hintText: "Email",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          // You can add more complex validation here if needed
                          return null;
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),
                      PField(
                        obsecure: true,
                        controller: password,
                        prefixIcon: Icon(Icons.lock),
                        hintText: "Password",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          // You can add more complex validation here if needed
                          return null;
                        },
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
                            color: AppColors.kWhite),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Column(
                    children: [
                      PButton(
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            Get.offAll(() => const MainPage());
                          }
                        },
                        text: 'LogIn',
                        color: AppColors.kPrimary,
                        borderRadius: 20,
                        height: 46,
                        width: 327,
                        fontSize: 14,
                      ),
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: SignUpButton(
                          title: 'Don’t have an account ?',
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
                  const SizedBox(height: 18),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: [
                        const Log_Divider(title: 'Or Sign In with'),
                        const SizedBox(height: 18),
                        GoogleButton(
                          height: 56,
                          textColor: AppColors.kWhite,
                          width: 260,
                          onTap: () async {
                            await FirebaseServices().signInWithGoolge();
                            Get.offAll(() => const MainPage());
                          },
                          borderRadius: 24,
                          bgColor: AppColors.kBackground.withOpacity(0.3),
                          text: 'Continue with Google',
                          icons: AppAssets.kGoogleLogo,
                        ),
                        SizedBox(
                          height: 30,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
