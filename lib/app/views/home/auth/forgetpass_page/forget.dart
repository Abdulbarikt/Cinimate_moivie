import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_api/app/utils/colors.dart';
import 'package:movie_api/app/views/widgets/p_button.dart';
import 'package:movie_api/app/views/widgets/p_field.dart';

class ForgetPass extends StatelessWidget {
  const ForgetPass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    Future<void> resetPassword() async {
      try {
        await FirebaseAuth.instance
            .sendPasswordResetEmail(email: email.text.trim());
        showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              content: Text("Password reset link sent! Check It"),
            );
          },
        );
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("$e"),
            );
          },
        );
      }
    }

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/forget.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text(
                "Forgot your password",
                style: TextStyle(
                  fontSize: 30,
                  color: AppColors.kWhite,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "  Please enter your e-mail address below \n to receive your user and a new password",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.kWhite,
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              PField(
                  prefixIcon: Icon(Icons.email),
                  obsecure: false,
                  hintText: 'Email',
                  controller: email,
                  width: 327,
                  height: 52),
              const SizedBox(
                height: 23,
              ),
              PButton(
                onTap: () {
                  resetPassword();
                  email.clear();
                },
                text: 'Send',
              ),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
