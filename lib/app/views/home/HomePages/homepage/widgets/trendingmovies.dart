// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_api/app/views/home/HomePages/homepage/detialpage.dart';

import '../../../../../services/api/apikey.dart';

class TrendingMovies extends StatelessWidget {
  const TrendingMovies({
    super.key,
    required this.snapshot,
  });
  final AsyncSnapshot snapshot;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CarouselSlider.builder(
        itemCount: snapshot.data.length,
        options: CarouselOptions(
            enlargeCenterPage: true,
            autoPlay: true,
            height: 250,
            pageSnapping: true,
            aspectRatio: 16 / 9,
            viewportFraction: 0.8,
            autoPlayCurve: Curves.fastOutSlowIn,
            autoPlayAnimationDuration: const Duration(milliseconds: 800)),
        itemBuilder: (context, itemIndex, pageViewIndex) {
          return GestureDetector(
            onTap: () {
              Get.to(() => DetialPage(movie: snapshot.data[itemIndex]));
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Image.network(
                  '${ApiKey.imagePath}${snapshot.data[itemIndex].posterPath}',
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
