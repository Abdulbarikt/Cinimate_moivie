import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_api/app/services/firebase_options.dart';

import 'app/views/home/Onboarding/homepage.dart';

void main() async {
  runApp(const MyApp());
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
      home: const OnboardingPage(),
    );
  }
}
