import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_api/app/views/home/HomePages/homepage/detialpage.dart';

import '../../../../services/api/apikey.dart';
import '../../../../utils/colors.dart';

class SearchSlider extends StatelessWidget {
  const SearchSlider({
    super.key,
    required this.snapshot,
  });

  // ignore: prefer_typing_uninitialized_variables
  final snapshot;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8),
          child: GestureDetector(
            onTap: () {
              final movie = snapshot.data![index];
              Get.to(() => DetialPage(movie: movie));
            },
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: SizedBox(
                    height: 200,
                    width: 130,
                    child: Image.network(
                      "${ApiKey.imagePath}${snapshot.data![index].posterPath}",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        snapshot.data![index].title,
                        style: const TextStyle(
                          color: AppColors.kWhite,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        snapshot.data![index].overview,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: AppColors.kWhite,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
