import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_api/app/utils/colors.dart';

class Search extends StatelessWidget {
  const Search({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBlackColor,
      appBar: AppBar(
        backgroundColor: AppColors.kBlackColor,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          "Search",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28,
            color: AppColors.kWhite,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                suffixIcon: const Icon(
                  Icons.search_rounded,
                  color: AppColors.kPrimary,
                  size: 30,
                ),
                hintText: 'Search...',
                hintStyle: const TextStyle(color: AppColors.kWhite),
                fillColor: const Color.fromARGB(255, 143, 134, 134),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide:
                      const BorderSide(color: AppColors.kPrimary, width: 2.0),
                ),
              ),
              style: const TextStyle(color: AppColors.kWhite),
            ),
            const SizedBox(
              height: 90,
            ),
            Column(
              children: [
                Lottie.asset("assets/images/No_data.json"),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  "Search for your favorite movies ",
                  style: TextStyle(fontSize: 13, color: AppColors.kPrimary),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
