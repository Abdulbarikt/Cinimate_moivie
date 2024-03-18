import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:movie_api/app/models/cast.dart';
import 'package:movie_api/app/models/trailer.dart';
import 'package:movie_api/app/models/trending.dart';
import 'package:movie_api/app/services/api/apikey.dart';
import 'package:movie_api/app/utils/colors.dart';
import 'package:movie_api/app/views/home/HomePages/homepage/widgets/trailers.dart';

import 'widgets/customslider.dart';

class DetialPage extends StatefulWidget {
  final movie;
  const DetialPage({
    super.key,
    required this.movie,
  });

  @override
  State<DetialPage> createState() => _DetialPageState();
}

class _DetialPageState extends State<DetialPage> {
  late Future<List<Trending>> similar;
  late Future<List<Cast>> cast;
  late Future<TrailerModel> trailer;

  List<Map<String, dynamic>> movieTrailerList = [];

  @override
  void initState() {
    similar = ApiKey().getSimilarMovies(widget.movie.id);
    cast = ApiKey().getCast(widget.movie.id);
    trailer = ApiKey().trailer(widget.movie.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.snackbar(
              'Cinimate',
              'Added to wishlist',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.black,
              colorText: Colors.white,
              borderRadius: 10,
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              duration: const Duration(seconds: 3),
            );
            User? user = FirebaseAuth.instance.currentUser;
            FirebaseFirestore.instance
                .collection('wishlist')
                .doc(user!.uid)
                .collection('spwish')
                .doc()
                .set({
              "movie": widget.movie.title ?? widget.movie.name,
              "image": widget.movie.backdropPath,
              "description": widget.movie.overview,
            });
          },
          child: const Icon(Icons.favorite)),
      backgroundColor: AppColors.kBlackColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            backgroundColor: AppColors.kBlackColor,
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: ClipRRect(
                child: FutureBuilder<TrailerModel>(
                  future: trailer,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Trailer(videoId: snapshot.data!.results[0].key);
                    } else if (snapshot.hasError) {
                      return Image.network(
                        "${ApiKey.imagePath}${widget.movie.backdropPath}",
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.cover,
                      );
                    }
                    return Image.network(
                      "${ApiKey.imagePath}${widget.movie.backdropPath}",
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.movie.title ?? widget.movie.name,
                    style: const TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.w900,
                        color: AppColors.kWhite),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.confirmation_number,
                        size: 16,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Movie ID: ${widget.movie.id}',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.kPrimary,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 14,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '${widget.movie.voteAverage!.toStringAsFixed(1)}/10',
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w900,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.kPrimary,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.movie_rounded,
                              size: 14,
                              color: AppColors.kWhite,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              widget.movie.mediaType ?? 'Movie',
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w900,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.kPrimary,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.calendar_today,
                              size: 14,
                              color: Colors.blue,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              widget.movie.releaseDate ?? "2024",
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w900,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Overview',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.movie.overview!,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Cast",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 170,
                    child: FutureBuilder<List<Cast>>(
                      future: cast,
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Center(
                            child: Text(snapshot.error.toString()),
                          );
                        } else if (snapshot.hasData) {
                          return ListView.separated(
                            separatorBuilder: (context, index) {
                              return const SizedBox(
                                width: 10,
                              );
                            },
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: const EdgeInsets.all(8),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 100,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            "${ApiKey.imagePath}${snapshot.data![index].profilePath}",
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 2,
                                            blurRadius: 4,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    Text(
                                      snapshot.data![index].name!,
                                      style: const TextStyle(
                                        color: AppColors.kWhite,
                                      ),
                                    ),
                                    Text(
                                      snapshot.data![index].character!,
                                      style: const TextStyle(
                                        color: AppColors.kWhite,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                  ),
                  const Text(
                    "More Like This",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: AppColors.kPrimary),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    child: FutureBuilder(
                      future: similar,
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Center(
                            child: Text(snapshot.hasError.toString()),
                          );
                        } else if (snapshot.hasData) {
                          return CustomSlider(snapshot: snapshot);
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
