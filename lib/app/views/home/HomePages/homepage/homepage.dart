import 'package:flutter/material.dart';
import 'package:movie_api/app/models/tvshow.dart';
import 'package:movie_api/app/views/home/HomePages/homepage/widgets/customslider.dart';

import '../../../../models/trending.dart';
import '../../../../services/api/apikey.dart';
import '../../../../utils/colors.dart';
import 'widgets/trendingmovies.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Trending>> trendingMovies;
  late Future<List<Trending>> topRated;
  late Future<List<Trending>> upcoming;
  late Future<List<Trending>> malayalam;

  late Future<List<TvShow>> popular;

  @override
  void initState() {
    super.initState();
    trendingMovies = ApiKey().getTrendingMovies();
    topRated = ApiKey().getTopRated();
    upcoming = ApiKey().getUpcoming();
    popular = ApiKey().getPopularTvShows();
    malayalam = ApiKey().getMalayamLanguage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.kBlackColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.kBlackColor,
          title: const Text(
            'Cinimate',
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w900,
                color: AppColors.kWhite),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 19, bottom: 20),
                  child: Text(
                    "Trending Movies",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.kPrimary),
                  ),
                ),
                SizedBox(
                  child: FutureBuilder(
                    future: trendingMovies,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(snapshot.hasError.toString()),
                        );
                      } else if (snapshot.hasData) {
                        return TrendingMovies(snapshot: snapshot);
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 19, bottom: 20),
                  child: Text(
                    "Top Rated Movies",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.kPrimary),
                  ),
                ),
                SizedBox(
                  child: FutureBuilder(
                    future: topRated,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(snapshot.hasError.toString()),
                        );
                      } else if (snapshot.hasData) {
                        return CustomSlider(snapshot: snapshot);
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 19, bottom: 20),
                  child: Text(
                    "Malayalam Movies",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.kPrimary),
                  ),
                ),
                SizedBox(
                  child: FutureBuilder(
                    future: malayalam,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(snapshot.hasError.toString()),
                        );
                      } else if (snapshot.hasData) {
                        return CustomSlider(snapshot: snapshot);
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 19, bottom: 20),
                  child: Text(
                    "Upcoming Movies",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.kPrimary),
                  ),
                ),
                SizedBox(
                  child: FutureBuilder(
                    future: upcoming,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(snapshot.hasError.toString()),
                        );
                      } else if (snapshot.hasData) {
                        return CustomSlider(snapshot: snapshot);
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 19, bottom: 20),
                  child: Text(
                    "Popular Tv Shows",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.kPrimary),
                  ),
                ),
                SizedBox(
                  child: FutureBuilder(
                    future: popular,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(snapshot.hasError.toString()),
                        );
                      } else if (snapshot.hasData) {
                        return CustomSlider(snapshot: snapshot);
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
