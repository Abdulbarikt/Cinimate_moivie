import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_api/app/services/firebase_options.dart';
import 'app/views/home/HomePages/homepage/homepage.dart';
import 'app/views/home/HomePages/main_page.dart';
import 'app/views/home/Onboarding/homepage.dart';

void main() async {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(fontFamily: 'Plus Jakarta Sans'),
      debugShowCheckedModeBanner: false,
      title: 'Cinimate',
      home:

          // StreamBuilder(
          //     stream: FirebaseAuth.instance.authStateChanges(),
          //     builder: (context, snapshot) {
          //       if (snapshot.hasData) {
          //         return const MainPage();
          //       } else {
          //         return const HomePage();
          //       }
          //     }),
          const OnboardingPage(),
    );
  }
}
