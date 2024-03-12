import 'package:flutter/material.dart';
import 'package:movie_api/app/models/trending.dart';
import 'package:movie_api/app/services/api/apikey.dart';
import 'package:movie_api/app/utils/colors.dart';
import 'package:movie_api/app/views/home/HomePages/homepage/widgets/upcoming.dart';

class DetialPage extends StatefulWidget {
  const DetialPage({super.key, required this.movie});
  final Trending movie;

  @override
  State<DetialPage> createState() => _DetialPageState();
}

class _DetialPageState extends State<DetialPage> {
  late Future<List<Trending>> upcoming;

  @override
  void initState() {
    upcoming = ApiKey().getUpcoming();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBlackColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            backgroundColor: AppColors.kBlackColor,
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24)),
                child: Image.network(
                  "${ApiKey.imagePath}${widget.movie.backdropPath}",
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.fill,
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
                    widget.movie.title!,
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
                        // height: 39,
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
                              widget.movie.releaseDate!.toString(),
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
                        // fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  const Text(
                    "More Like This",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: AppColors.kPrimary),
                  ),
                  const SizedBox(
                    height: 5,
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
                          return UpcoimgSlider(snapshot: snapshot);
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      },
                    ),
                  ),
                  // Text(
                  //   movie.id.toString(), // Convert List<int> to String
                  //   style: const TextStyle(
                  //     fontSize: 14,
                  //     // fontWeight: FontWeight.w900,
                  //     color: Colors.white,
                  //   ),
                  // ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
