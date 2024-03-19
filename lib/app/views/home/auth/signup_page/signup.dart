import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_api/app/utils/images.dart';
import 'package:movie_api/app/views/home/auth/login_page/login.dart';
import 'package:movie_api/app/views/widgets/Log_Divider.dart';
import 'package:movie_api/app/views/widgets/SignUpButton.dart';
import 'package:movie_api/app/views/widgets/google_button.dart';
import 'package:movie_api/app/views/widgets/p_field.dart';

import '../../../../controller/auth_countroller.dart';
import '../../../../services/google_services.dart';
import '../../../../utils/colors.dart';
import '../../../widgets/p_button.dart';
import '../../HomePages/main_page.dart';

class SignUp extends StatelessWidget {
  const SignUp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    TextEditingController username = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/signup.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Form(
              key: formKey,
              child: SizedBox(
                width: 327,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Create Account',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: AppColors.kWhite,
                      ).copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'We are happy to see you. Sign Up for your account',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.kWhite,
                      ).copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        PField(
                          prefixIcon: Icon(Icons.person_3),
                          obsecure: false,
                          controller: username,
                          width: 327,
                          height: 52,
                          hintText: 'Username',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your username';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 7),
                        PField(
                          prefixIcon: Icon(Icons.email),
                          obsecure: false,
                          controller: email,
                          width: 327,
                          height: 52,
                          hintText: 'Email',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
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
                          prefixIcon: Icon(Icons.lock),
                          obsecure: true,
                          controller: password,
                          width: 327,
                          height: 52,
                          hintText: 'Password',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    Column(
                      children: [
                        PButton(
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              AuthController().registerUser(
                                email.text,
                                password.text,
                                username.text,
                              );
                              Get.to(() => LoginScreen());
                            }
                          },
                          text: 'Create Account',
                          borderRadius: 20,
                          height: 46,
                          width: 327,
                        ),
                        const SizedBox(height: 10),
                        SignUpButton(
                          title: 'Already have an account? ',
                          subtitle: 'Log In',
                          onTab: () {
                            Get.to(() => LoginScreen());
                          },
                          subtitleTextStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.kPrimary,
                          ).copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Log_Divider(title: 'Or Sign Up with'),
                          ),
                          const SizedBox(height: 14),
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
          ),
        ],
      ),
    );
  }
}
