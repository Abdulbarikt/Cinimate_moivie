import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_api/app/utils/colors.dart';

import '../../../../models/trending.dart';
import '../../../../services/api/apikey.dart';
import 'serarchslider.dart';

class Search extends StatefulWidget {
  const Search({
    super.key,
  });

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  late Future<List<Trending>> searchMovies;

  @override
  void initState() {
    super.initState();
    searchMovies = Future.value([]);
  }

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
              onChanged: (value) {
                setState(() {
                  searchMovies = ApiKey().searchMovie(value);
                });
              },
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
            Expanded(
              child: FutureBuilder<List<Trending>>(
                future: searchMovies,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                        child: CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(AppColors.kPrimary),
                      strokeWidth: 3,
                    ));
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        'Error: ${snapshot.error}',
                        style: const TextStyle(color: AppColors.kWhite),
                      ),
                    );
                  } else if (snapshot.hasData) {
                    return SearchSlider(
                      snapshot: snapshot,
                    );
                  } else {
                    return Center(
                      child: Column(
                        children: [
                          Lottie.asset("assets/images/No_data.json"),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text(
                            "Search for your favorite movies ",
                            style: TextStyle(
                                fontSize: 13, color: AppColors.kPrimary),
                          )
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
